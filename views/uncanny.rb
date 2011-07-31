module Storying
  module Views
    class Uncanny < StoryView
      include StoryElements

      has_random_story_element :uncanny_skill, :unique => true

      def uncanny_element
        @story.uncanny_element ||= uncanny_elements.random
      end

      def success_case
        uncanny_challenges[uncanny_element]['success'].random_pop
      end

      def failure_case
        uncanny_challenges[uncanny_element]['failure'].random_pop
      end

      def hero_gift_type
        @gift_type ||= uncanny_elements.random
      end

      def support_gift_type
        @gift_type ||= uncanny_elements.random
      end

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
