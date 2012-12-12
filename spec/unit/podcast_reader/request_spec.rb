require 'spec_helper'

describe PodcastReader::Request do
  let(:request) {
    PodcastReader::Request.new('http://feeds.feedburner.com/RubyRogues')
  }
  describe "#host" do
    it 'extract the host of url pass in args' do
      request.host.should eq 'http://feeds.feedburner.com'
    end
  end

  describe "#body" do
    it 'return the bod of the request', :vcr => true do
      request.body.keys.should eq ['rss']
    end
  end
end
