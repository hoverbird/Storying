# Captain Doris Roberts is about to save the universe... or destroy it.
# 
# Aboard her ship Head Trauma, she receives a distress call from a sleepy village on the Great Lakes.

module Storying
  module Views
    class SpaceOpera < StoryView      

      # Ugh too much repetition, should make API like:
      # has_random_story_element :evil_ship, :from => space_ship_names
      
      def ship
        @ship ||= space_ship_names.random_pop
      end
      
      def evil_ship
        @ship ||= space_ship_names.random_pop
      end
      
      def faction
        space_factions.random_pop
      end
      
      def support
        story.supporting_character ||= Storying::SupportingCharacter.new :gender => hero.opposite_sex
      end
      
      def villain 
        story.villain ||= Storying::SupportingCharacter.new :gender => hero.gender, :story => story
      end
      
      def villain_name
        villain.female?? villain.name : villain.last_name
      end

      def num_years
        (1..10).random.to_s + " thousand"
      end
      
    end
  end
end
