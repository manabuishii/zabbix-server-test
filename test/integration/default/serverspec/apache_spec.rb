require 'serverspec'
set :backend, :exec

describe "apache Daemon" do

  it "is listening on port 80" do
    expect(port(80)).to be_listening
  end

  httpservice="httpd"
  if ['debian', 'ubuntu'].include?(os[:family])
    httpservice="apache2"
  end
  it "has a running service of httpd" do
    expect(service(httpservice)).to be_running
  end

end
