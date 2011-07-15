module Storying
  class Hero < Character
    has_randomized_story_element :goal, :job
  end
end