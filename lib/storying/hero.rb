module Storying
  class Hero < Character
    has_random_story_element :goal, :job
  end
end