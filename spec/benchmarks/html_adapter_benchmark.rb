require 'benchmark'
require 'podcast_reader'

urls = [
  'http://feeds.feedburner.com/RubyRogues',
  'http://feeds.feedburner.com/RubyFreelancersShow',
  'http://feeds.feedburner.com/railscasts',
  'http://feeds.feedburner.com/JavascriptJabber',
  'http://feeds.feedburner.com/Ruby5',
  'http://feeds.feedburner.com/ParlonsRubyPodcast'
]

Benchmark.bm do |x|
  x.report("net_http") {
    Faraday.default_adapter = :net_http
    urls.each do |url|
      PodcastReader::Podcast.new(url).entries
    end
  }

  x.report("typhoeus") {
    require 'typhoeus/adapters/faraday'
    Faraday.default_adapter = :typhoeus
    urls.each do |url|
      PodcastReader::Podcast.new(url).entries
    end
  }

  x.report("excon") {
    Faraday.default_adapter = :excon
    urls.each do |url|
      PodcastReader::Podcast.new(url).entries
    end
  }

  x.report("em_synchrony") {
    require 'eventmachine'
    Faraday.default_adapter = :excon
    urls.each do |url|
      PodcastReader::Podcast.new(url).entries
    end
  }

end
