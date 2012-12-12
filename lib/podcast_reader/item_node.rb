module PodcastReader
  class ItemNode
    include Virtus
    include Adamantium

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
