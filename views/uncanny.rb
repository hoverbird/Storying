module Storying
  module Views
    class Uncanny < StoryView
      def uncanny_philosophy
        Storying.uncanny_philosophies.random_pop
      end
    end
  end
end
