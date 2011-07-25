module Storying
  module Views
    class Uncanny < StoryView

      def uncanny_philosophy
        Storying.uncanny_philosophies.random_pop
      end

      def uncanny_phrase
        Storying.uncanny_phrase.random_pop
      end

      def magic_element
        @magic_element ||= Storying.uncanny_elements.random
      end

      def uncanny_skills
        Storying.uncanny_skills.random_pop
      end

    end
  end
end
