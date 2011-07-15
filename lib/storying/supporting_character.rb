module Storying
  class SupportingCharacter < Character
    include CharacterAttributes
    randomize_character_traits :gender, :goal, :job

    def villain?
      @villain ||= 10.percent.chance.happens?
    end

    def relationship_to_hero
      @relationship_to_hero ||= Storying.relationships_to_character.random
    end
  end
end