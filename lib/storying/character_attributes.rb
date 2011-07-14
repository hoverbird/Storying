#  shared by all characters
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

    def possesive_pronoun
      gender == 'woman' ? 'her' : 'his'
    end

    def personal_pronoun(type = :subject)
      if type.to_sym == :object
        gender == 'woman' ? 'her' : 'him'
      else
        gender == 'woman' ? 'she' : 'he'
      end
    end

    def characteristic
      @characteristic ||= Storying.characteristics.random
    end

    def relationship_to_setting
      @relationship_to_setting ||= [Storying.relationships_to_setting.random, @story.setting].join(' ')
    end

    def name
      @names ||= Storying.names[gender].random
    end

  end
end