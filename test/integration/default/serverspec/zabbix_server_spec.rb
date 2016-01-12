require 'spec_helper'


describe "zabbix-server Daemon" do

  it "is listening on port 10051" do
    expect(port(10051)).to be_listening
  end
end

#
servicename="zabbix_server"

if os[:family] == 'redhat'
  servicename="zabbix_server"
end

describe 'zabbix_server Daemon' do
  if os[:family] == 'redhat'
    describe command( '/usr/sbin/chkconfig | tail -n 1') do
      its(:stdout) { should match "zabbix_server  	0:off	1:off	2:on	3:on	4:on	5:on	6:off" }
    end
  else
    describe service(servicename) do
       it { should be_enabled }
       it { should be_running }
    end
  end
end
