#  shared by all characters
module Storying
  module CharacterAttributes

    def possessive_pronoun
      female?? 'her' : 'his'
    end

    def personal_pronoun(type = :subject)
      if type.to_sym == :object
        female?? 'her' : 'him'
      else
        female?? 'she' : 'he'
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
    alias :to_s :name

    def full_name
      @full_name ||= [name, Storying.last_names.random].join(' ')
    end

  end
end