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

  it 'information about channel' do
    podcast.channel.should eq PodcastReader::Channel.new(
      :description=> "Rubyist.where(:rogue => true).limit(5).all.talk(:about => Topics.where(:awesome => true))",
      :language =>"en-US",
      :link=>"http://rubyrogues.com",
      :title=>"Ruby Rogues"
    )
  end
end
