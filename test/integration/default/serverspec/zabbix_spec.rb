require 'spec_helper'


describe "zabbix Daemon" do

  it "is listening on port 10050" do
    expect(port(10050)).to be_listening
  end

  it "has a running service of zabbix" do
    expect(service("zabbix")).to be_running
  end

end
