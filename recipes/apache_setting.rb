# update Apache2 setting for Apache 2.4
#

ruby_block "edit apache2 zabbix localhost" do
  block do
    rc = Chef::Util::FileEdit.new("/etc/apache2/sites-available/localhost.conf")
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
    # write file
    rc.write_file
  end
  action :nothing
  subscribes :create, "template[/etc/apache2/sites-available/localhost.conf]" #, :immediatelly
  notifies :run, "bash[restartapache]", :delayed
end

apacheservice="/etc/init.d/apache2"

case node[:platform]
when "ubuntu"
  apacheservice="/etc/init.d/apache2"
  #apacheservice = "echo "
when "centos"
  apacheservice="/etc/init.d/httpd"
end

bash "restartapache" do
  action :nothing
  code   <<-EOH
     #{apacheservice} restart
  EOH
end
