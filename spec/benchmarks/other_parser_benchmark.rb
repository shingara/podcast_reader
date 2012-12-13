require 'benchmark'
require 'podcast_reader'
require 'feedzirra'

urls = [
  'http://feeds.feedburner.com/RubyRogues',
  'http://feeds.feedburner.com/RubyFreelancersShow',
  'http://feeds.feedburner.com/railscasts',
  'http://feeds.feedburner.com/JavascriptJabber',
  'http://feeds.feedburner.com/Ruby5',
  'http://feeds.feedburner.com/ParlonsRubyPodcast'
]

Faraday.default_adapter = :excon
MultiXml.parser = :nokogiri

Benchmark.bmbm do |x|

  x.report("feedzirra") {
    3.times {
    urls.each do |url|
      Feedzirra::Feed.fetch_and_parse(url)
    end
    }
  }

  x.report("podcast_reader") {
    3.times {
    urls.each do |url|
      PodcastReader::Podcast.new(url).entries
    end
    }
  }
end
