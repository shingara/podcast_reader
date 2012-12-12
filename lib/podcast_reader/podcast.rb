class PodcastReader::Podcast

  include Adamantium

  ##
  # the url of this podcast
  #
  # @example
  #   podcast = Podcast.new('http://feeds.feedburner.com/RubyRogues')
  #   podcast.url
  #
  # @return String url
  #
  # @api public
  #
  attr_reader :url

  ##
  # Initialize a Podcast by his url
  #
  # @example
  #   podcast = Podcast.new('http://feeds.feedburner.com/RubyRogues')
  #
  # @param [ String ] url the url of podcast
  #
  # @api public
  #
  def initialize(url)
    @url = url
  end


  ##
  # List of entries in this feed
  #
  # @example
  #   podcast.entries
  #
  # @return [ Array<ItemNode> ]
  #   all entries in this podcast
  #
  # @api public
  def entries
    [].tap {|entries|
      request.body['rss']['channel']['item'].each do |item|
        entries << PodcastReader::ItemNode.new(item)
      end
    }
  end
  memoize :entries

  ##
  # The Faraday connection
  #
  # @return [ PodcastReader::Request ]
  #
  # @api private
  def request
    PodcastReader::Request.new(url)
  end
  memoize :request, :freezer => :flat

end
