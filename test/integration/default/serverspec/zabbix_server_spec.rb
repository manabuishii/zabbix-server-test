require 'spec_helper'


describe "zabbix-server Daemon" do

  it "is listening on port 10051" do
    expect(port(10051)).to be_listening
  end

  it "has a running service of zabbix-server" do
    expect(service("zabbix")).to be_running
  end

end
