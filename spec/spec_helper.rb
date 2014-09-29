require 'bundler/setup'
Bundler.setup

require 'pry'
require 'gsa_auctions'

RSpec.configure do |config|
  # some (optional) config here
end

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
