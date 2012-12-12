require 'spec_helper'

describe PodcastReader::Podcast, :vcr => true do
  let(:podcast) {
    PodcastReader::Podcast.new('http://feeds.feedburner.com/RubyRogues')
  }

  it 'list all feed' do
    podcast.entries.should be_a(Array)
    podcast.entries.each do |entry|
      entry.should be_a(PodcastReader::ItemNode)
    end
  end
end
