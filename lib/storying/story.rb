module Storying
  class Story
    include StoryElements
    has_random_story_element :setting, :conflict

    attr_reader :hero
    attr_accessor :villain, :supporting_character
    alias :support :supporting_character

    def initialize
      @hero = Hero.new(:story => self)
      @supporting_character = SupportingCharacter.new(:story => self)
    end
    
  end
end