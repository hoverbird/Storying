require 'spec_helper'

describe Storying::Story do
  attr_reader :story

  context "when new" do
    before do
      @story = Storying::Story.new
    end

    it "has a hero and supporting character" do
      @story.hero.should be_kind_of Storying::Hero
      @story.supporting_character.should be_kind_of Storying::SupportingCharacter
    end
  end
end