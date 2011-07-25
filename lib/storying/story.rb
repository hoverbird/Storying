module Storying
  class Story
    include StoryElements
    has_randomized_story_element :setting, :conflict

    attr_reader :hero
    attr_writer :supporting_character
    attr_accessor :villain

    def initialize
      @hero = Hero.new(:story => self)
      @supporting_character = SupportingCharacter.new(:story => self)
    end

    def supporting_character
      @supporting_character
    end

    def magic_element
      @magic_element ||= Storying.uncanny_elements.random
    end
  end
end