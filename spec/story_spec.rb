require 'spec_helper'

describe Storying::Story do
  context "when new" do
    let(:story) { Storying::Story.new}

    it "has a hero and supporting character" do
      story.hero.should be_kind_of Storying::Hero
      story.supporting_character.should be_kind_of Storying::SupportingCharacter
    end


    it "has getters for the story_elements YML files in /story_elements" do
      story.last_names.should be_kind_of(Array)
    end

    it "returns the same array on each get" do
      story.last_names.object_id.should == story.last_names.object_id
    end

  end
end