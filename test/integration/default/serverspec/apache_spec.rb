require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end


describe "apache Daemon" do

  it "is listening on port 80" do
    expect(port(80)).to be_listening
  end

  httpservice="httpd"
  if ['Debian', 'Ubuntu'].include?(os[:family])
    httpservice="apache2"
  end
  it "has a running service of httpd" do
    expect(service(httpservice)).to be_running
  end

end
