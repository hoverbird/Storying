module Storying
  module Views
    class StoryView < Mustache

      def story
        @story ||= Storying::Story.new
      end

      def hero
        story.hero
      end

      def support
        story.supporting_character
      end

    end
  end
end