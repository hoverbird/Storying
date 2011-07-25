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

    def personal_pronoun
      female?? 'she' : 'he'
    end

    def personal_pronoun_object
      female?? 'her' : 'him'
    end
  end
end