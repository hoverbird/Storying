module Storying
  module UncannyGift
    include StoryElements
    # has_random_story_element :uncanny_gift, :from => :uncanny_elements

    def uncanny_gift
      @uncanny_gift ||= uncanny_elements.random
    end

    def can_handle_element
      uncanny_gift == @story.uncanny_element
    end

  end
end