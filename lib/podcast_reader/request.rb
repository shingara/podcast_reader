require 'faraday'
require 'faraday_middleware'
require 'multi_xml'
require 'uri'

class PodcastReader::Request
  include Adamantium

  ##
  # Initialize the PodcastReader::Request
  #
  # @example
  #   PodcastReader::Request.new('http://feeds.feedburner.com/RubyRogues')
  #
  # @param [ String ] url the url
  #
  # @api public
  #
  def initialize(url)
    @url = URI(url)
  end
  ##
  # Extract the host of url pass in args
  #
  # @example
  #   request.host
  #
  # @return [ String ]
  #   the host of this url
  #
  # @api private
  #
  def host
    "#{@url.scheme}://#{@url.host}"
  end

  ##
  # the body of resource fetch on the url
  #
  # @example
  #   request.body
  #
  # @return [ Hash ] the body in hash
  #
  # @api public
  #
  def body
    connection.get(@url.path).body
  end


  ##
  # Instanciate the Faraday connection from the url
  #
  # @return [ Faraday ]
  #   the faraday connection
  #
  # @api private
  #
  def connection
    Faraday.new(:url => host) do |faraday|
      #faraday.response :logger                  # log requests to STDOUT
      faraday.response :xml,  :content_type => /\bxml$/
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
  memoize :connection, :freezer => :noop

end
