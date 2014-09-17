require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end


describe "zabbix web" do
  getcommand = "curl http://localhost"
  if ['Debian', 'Ubuntu'].include?(os[:family])
    getcommand = "wget http://localhost -O -"
  end
  describe command(getcommand) do
    it { should return_stdout /Zabbix 2.2.5/}
  end
end
