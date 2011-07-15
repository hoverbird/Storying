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

  end
end