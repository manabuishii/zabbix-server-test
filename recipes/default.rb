# for centos mysql-devel is needed. but install it by recipe[mysql::client]

link "/etc/httpd/conf-enabled/php.conf" do
  to "/etc/httpd/conf.d/php.conf"
end

