require 'serverspec'
set :backend, :exec
set :path, '/usr/bin:/sbin:/usr/local/sbin:$PATH'

RSpec.configure do |c|
  c.output_stream = File.open('/tmp/result/serverspec-result.xml', 'w')
  c.formatter = 'RspecJunitFormatter'
end
