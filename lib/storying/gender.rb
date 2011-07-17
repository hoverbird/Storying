module Storying
  module Gender
    include StoryElements
    has_randomized_story_element :gender

    def female?
      gender == 'woman'
    end

    def male?
      gender == 'man'
    end

    def opposite_sex
      female?? 'man' : 'woman'
    end

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

    def noun_as_parent
      female?? 'mother' : 'father'
    end
    
    def noun_as_child
      female?? 'daughter' : 'son'
    end
    
    def noun_as_sibling
      female?? 'sister' : 'brother'
    end
    
  end
end