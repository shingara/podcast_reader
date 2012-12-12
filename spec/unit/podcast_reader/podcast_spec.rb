require 'spec_helper'

describe PodcastReader::Podcast do
  let(:url) { 'http://feeds.feedburner.com/RubyRogues' }
  let(:podcast) {
    PodcastReader::Podcast.new(url)
  }

  describe '#entries' do
    let(:request) {
      stub(
        :body => {
          'rss' => {
            'channel' => {
              'item' => [
                {'title' => '083 RR Decomposing Fat Models with Bryan Helmkamp'}
              ]
            }
          }
        }
      )
    }
    before do
      PodcastReader::Request.stubs(:new).with(url).returns(request)
    end

    it 'return a list of entries' do
      podcast.entries.should be_a(Array)
      podcast.entries.each do |item|
        item.should be_a(PodcastReader::ItemNode)
      end
    end
  end
end
