#  all characters have these
module Storying
  module CharacterAttributes
    def initialize(options = {})
      options.each_pair do |key, value|
        instance_variable_set "@#{key}", value
      end
    end

    def gender
      @gender ||= ['woman', 'man'].random
    end

    def gendered_possesive_adjective
      gender == 'woman' ? 'her' : 'his'
    end

    def gendered_personal_pronoun
      # dative case only
      gender == 'woman' ? 'her' : 'him'
    end

    def characteristic
      @characteristic ||= Storying.characteristics.random
    end

    def relationship_to_setting
      @relationship_to_setting ||= [Storying.relationships_to_setting.random, @story.setting].join(' ')
    end
  end
end