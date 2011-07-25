module Storying
  class SupportingCharacter < Character
    has_randomized_story_element :job, :goal

    def villain?
      @villain ||= 10.percent.chance.happens?
    end

    def relationship_to_hero
      @relationship_to_hero ||= relationships_to_character.random
    end
  end
end