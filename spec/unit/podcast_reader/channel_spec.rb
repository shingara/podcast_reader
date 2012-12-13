require 'spec_helper'
describe PodcastReader::Channel do
  it { should be_respond_to(:title) }
  it { should be_respond_to(:description) }
  it { should be_respond_to(:link) }
  it { should be_respond_to(:language) }
end
