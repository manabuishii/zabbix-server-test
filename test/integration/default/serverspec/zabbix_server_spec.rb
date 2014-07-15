require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end


describe "zabbix-server Daemon" do

  it "is listening on port 10051" do
    expect(port(10051)).to be_listening
  end

  it "has a running service of zabbix-server" do
    expect(service("zabbix")).to be_running
  end

end
