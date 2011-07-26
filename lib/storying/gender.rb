module Storying
  module Gender
    include StoryElements
    has_random_story_element :gender

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

    def personal_pronoun
      female?? 'she' : 'he'
    end

    def personal_pronoun_object
      female?? 'her' : 'him'
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

    def noun_as_ruler
      female?? 'queen' : 'king'
    end

  end
end