module Storying
  module Views
    class Wondermark < StoryView
      
      def method_missing(m)
        wondermarks[m].random
      end
      
    end
  end
end