module Storying
  module Views
    class YoungAdultFiction < StoryView
      def supporting_character
        story.supporting_character ||= Storying::SupportingCharacter.new(:gender => hero.opposite_sex)
      end
      
      def rival
        story.villain = Storying::SupportingCharacter.new(:gender => hero.gender, :job => support.job, :story => story)
      end
      
      def decade
        [70, 80, 90].random 
      end
      
      def late_teen
        (17..21).random
      end
    end
  end
end