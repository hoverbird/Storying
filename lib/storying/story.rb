module Storying
  class Story
    include StoryElements
    has_randomized_story_element :setting, :conflict

    attr_reader :hero
    attr_accessor :supporting_character, :villain

    def initialize
      @hero = Hero.new(:story => self)
      @supporting_character = SupportingCharacter.new(:story => self)
    end

    # TODO: not yet implemented
    def plot_twist
      # character = [hero, supporting_character, villain].compact.random
    end

  end
end