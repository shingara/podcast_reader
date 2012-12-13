require 'equalizer'
class PodcastReader::Channel
  include Virtus
  include ::Equalizer.new(:title, :link)
  attribute :title, String
  attribute :description, String
  attribute :link, String
  attribute :language, String
end
