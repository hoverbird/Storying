module Storying
  class Story
    attr_reader :setting, :hero, :supporting_character, :conflict, :villain

    def initialize
      @setting = Storying.settings.random
      @conflict = Storying.conflicts.random

      @hero = Hero.new(:story => self)
      @supporting_character = SupportingCharacter.new(:story => self)
    end

    # TODO: not yet implemented
    def plot_twist
      # character = [hero, supporting_character, villain].compact.random
    end

  end
end