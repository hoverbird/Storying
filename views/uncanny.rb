module Storying
  module Views
    class Uncanny < StoryView
      include StoryElements

      has_random_story_element :uncanny_element
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

      def gift_type
        @gift_type ||= uncanny_elements.random
      end
      
      def can_handle_element
        gift_type == uncanny_element
      end
      
      
    end
  end
end
