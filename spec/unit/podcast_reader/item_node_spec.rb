require 'spec_helper'

describe PodcastReader::ItemNode do
  it { should be_respond_to(:title) }
  it { should be_respond_to(:link) }
  it { should be_respond_to(:comments) }
  it { should be_respond_to(:published_at) }
  it { should be_respond_to(:author) }
  it { should be_respond_to(:categories) }
  it { should be_respond_to(:guid) }
  it { should be_respond_to(:description) }
end
