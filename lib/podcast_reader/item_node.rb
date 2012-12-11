module PodcastReader
  class ItemNode
    include Virtus

    attribute :title, String
    attribute :link, String
    attribute :comments, String
    attribute :published_at, DateTime
    attribute :author, String
    attribute :categories, Array[String]
    attribute :guid, String
    attribute :description, String
  end
end
