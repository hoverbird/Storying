module Storying
  module Views
    class Uncanny < StoryView
      include StoryElements

      has_random_story_element :magic_element
      has_random_story_element :uncanny_phrase, :uncanny_skill, :unique => true

      def uncanny_philosophy
        @uncanny_philosophy ||= uncanny_philosophies.random_pop
      end
      
      def age
        (22..32).random
      end
      
      def teen_age
        (15..20).random
      end
      
    end
  end
end
