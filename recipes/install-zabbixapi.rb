# Install zabbixapi 3.0.0 at compile time
# If maybe zabbix recipe is updated, this is not required.
e = execute "gem install zabbixapi -v 3.0.0" do
  action :nothing
end

e.run_action(:run)
