source 'https://rubygems.org'

# Specify your gem's dependencies in podcast_reader.gemspec
gemspec


gem 'mocha', :require => false
gem 'vcr'
gem 'webmock'
gem 'devtools',
  :git => 'git://github.com/datamapper/devtools.git'
  #:path => '/Users/shingara/prog/ruby/devtools'
eval File.read('Gemfile.devtools')

group :xml_adapter do
  # xml adapter
  gem 'ox'
  gem 'libxml-ruby'
  gem 'nokogiri'
end

group :html_adapter do
  # httml adapter
  gem 'excon'
  gem 'typhoeus'
  gem 'em-synchrony'
end

group :other_rss_parser do
  # other rss parser
  gem 'feedzirra'
end
