require 'rspec'

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

require 'podcast_reader'

Faraday.default_adapter = :net_http

RSpec.configure do |config|
  config.mock_framework = :mocha
end

require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock # or :fakeweb
  c.configure_rspec_metadata!
  c.cassette_library_dir = 'spec/cassettes'
end

