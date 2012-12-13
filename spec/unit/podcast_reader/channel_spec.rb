require 'spec_helper'
describe PodcastReader::Channel do
  it { should be_respond_to(:title) }
  it { should be_respond_to(:description) }
  it { should be_respond_to(:link) }
  it { should be_respond_to(:language) }

  describe "#link=" do
    context "with a simple link" do
      let(:link) { 'htp://hello' }
      it 'should set the link' do
        PodcastReader::Channel.new(:link => link).link.should eq link
      end
    end

    context "with a array of link" do
      let(:link) { ['htp://hello'] }
      it 'should set the link' do
        PodcastReader::Channel.new(:link => link).link.should eq link.first
      end
    end
  end
end
