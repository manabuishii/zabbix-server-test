# update Apache2 setting for Apache 2.4
#

apacheservice="/etc/init.d/apache2"
apachedirectory="/etc/apache2"
case node[:platform]
when "ubuntu"
  apacheservice="/etc/init.d/apache2"
  #apacheservice = "echo "
  apachedirectory="/etc/apache2"
when "centos"
  apacheservice="service httpd"
  apachedirectory="/etc/httpd"
end


ruby_block "edit apache2 zabbix localhost" do
  block do
    rc = Chef::Util::FileEdit.new("#{apachedirectory}/sites-available/localhost.conf")
    # RewriteLog
    rc.search_file_replace(/^(\s)*RewriteLog/, "\#RewriteLog")
    # Require all granted
    rc.insert_line_after_match(/^(\s)*Allow from all/, "Require all granted")
    rc.search_file_replace(/^(\s)*Allow from all/, "\#Allow from all")
    rc.search_file_replace(/^(\s)*Order allow,deny/, "\#Order allow,deny")
    # Require all denied
    rc.insert_line_after_match(/^(\s)*Deny from all/, "Require all denied")
    rc.search_file_replace(/^(\s)*Deny from all/, "\#Deny from all")
    rc.search_file_replace(/^(\s)*Order Deny,Allow/, "\#Order Deny,Allow")
    case node[:platform]
    when "centos"
      rc.search_file_replace(/^(\s)*Allow from 127.0.0.1/, "\#Allow from 127.0.0.1")
    end
    # write file
    rc.write_file
  end
  action :nothing
  subscribes :create, "template[#{apachedirectory}/sites-available/localhost.conf]" #, :immediatelly
  notifies :run, "bash[restartapache]", :delayed
end

bash "restartapache" do
  action :nothing
  code   <<-EOH
     #{apacheservice} restart
  EOH
end
