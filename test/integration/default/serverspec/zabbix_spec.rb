require 'spec_helper'

describe "zabbix-agent Daemon" do

  it "is listening on port 10050" do
    expect(port(10050)).to be_listening
  end

end

#
servicename="zabbix_agentd"

if os[:family] == 'redhat'
  servicename="zabbix_agentd"
end

describe 'zabbix-agent Daemon' do
  describe service(servicename) do
     it { should be_enabled }
     #it { should be_running }
  end
end
