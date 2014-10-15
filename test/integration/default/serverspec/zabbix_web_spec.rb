require 'spec_helper'
#set :path, '/usr/bin:/sbin:/usr/local/sbin:$PATH'

describe "zabbix web" do
  getcommand = "curl http://localhost"
  if ['debian', 'ubuntu'].include?(os[:family])
    getcommand = "wget http://localhost -O -"
  end
  describe command(getcommand) do
    its(:stdout) { should match /Zabbix 2.2.5/ }
    its(:exit_status) { should eq 0 }
  end
end
