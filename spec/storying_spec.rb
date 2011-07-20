require 'spec_helper'

describe "Storying" do
  it "has getters for the story_elements YML files in /story_elements" do
    Storying.last_names.should be_kind_of(Array)
  end

  it "returns the same array on each get" do
    Storying.last_names.object_id.should == Storying.last_names.object_id
  end
end