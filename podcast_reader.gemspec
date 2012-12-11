# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'podcast_reader/version'

Gem::Specification.new do |gem|
  gem.name          = "podcast_reader"
  gem.version       = PodcastReader::VERSION
  gem.authors       = ["Cyril Mougel"]
  gem.email         = ["cyril.mougel@gmail.com"]
  gem.description   = %q{Read a podcast}
  gem.summary       = %q{Read podcast}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'virtus'
end
