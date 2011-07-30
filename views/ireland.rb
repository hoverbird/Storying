module Storying
  module Views
    class Ireland < StoryView
      def season
        %w(winter autumn summer spring).random
      end
      
      def year
        (1950..1961).random 
      end
    end
  end
end
