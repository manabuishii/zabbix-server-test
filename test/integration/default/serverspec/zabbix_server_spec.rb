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
  describe service(servicename) do
     it { should be_enabled }
     it { should be_running }
  end
end
