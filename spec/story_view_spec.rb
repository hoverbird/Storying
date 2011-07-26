require 'spec_helper'

describe Storying::Views::StoryView do
  subject { Storying::Views::StoryView.new }

  it { should be_kind_of Mustache }

  it "should have story element accessors" do
    subject.names.should be_kind_of Hash
    subject.goals.should be_kind_of Array
  end

end