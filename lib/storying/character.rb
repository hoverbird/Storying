module Storying
  class Character
    include StoryElements
    include Gender

    has_randomized_story_element :characteristic, :last_name

    def initialize(options = {})
      # raise "You can't have a Character without a Story!" unless options[:story]
      options.each_pair do |key, value|
        instance_variable_set "@#{key}", value
      end
    end

    def relationship_to_setting
      @relationship_to_setting ||= [StoryElements.relationships_to_setting.random, @story.setting].join(' ')
    end

    def name
      @names ||= StoryElements.names[gender].random
    end
    alias :to_s :name

    def full_name
      @full_name ||= [name, last_name].join(' ')
    end

  end
end