require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end


describe "zabbix web" do
  describe command('curl http://localhost/') do
    it { should return_stdout /Zabbix 2.2.5/}
  end
end
