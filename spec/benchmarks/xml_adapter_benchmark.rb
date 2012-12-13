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
  x.report("ox") {
    MultiXml.parser = :ox
    urls.each do |url|
      PodcastReader::Podcast.new(url).entries
    end
  }

  x.report("libxml") {
    MultiXml.parser = :libxml
    urls.each do |url|
      PodcastReader::Podcast.new(url).entries
    end
  }

  x.report("nokogiri") {
    MultiXml.parser = :nokogiri
    urls.each do |url|
      PodcastReader::Podcast.new(url).entries
    end
  }

  x.report("rexml") {
    MultiXml.parser = :rexml
    urls.each do |url|
      PodcastReader::Podcast.new(url).entries
    end
  }

end
