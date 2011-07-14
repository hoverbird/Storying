module Storying
  class Story
    attr_reader :setting, :hero, :supporting_character, :conflict

    def initialize
      @setting = Storying.settings.random
      @conflict = Storying.conflicts.random

      @hero = Hero.new(:story => self)
      @supporting_character = SupportingCharacter.new(:story => self)
    end

  end
end