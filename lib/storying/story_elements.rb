module Storying
  module StoryElements
    STORY_ELEMENTS_PATH = ROOT + "/story_elements"

    class << self
      def included(base)
        base.extend(ClassMethods)
      end

      # Parse all of the story_elements YAML files and make accessor methods by filename
      Dir.open(STORY_ELEMENTS_PATH) do |dir|
        dir.each do |filename|
          next unless filename =~ /\.yml$/
          story_element_kind = filename.gsub('.yml', '').to_sym
          define_method(story_element_kind) { YAML.load_file(File.join(STORY_ELEMENTS_PATH, filename)) }
        end
      end
    end

    module ClassMethods
      # Creates an accessor  returning a randomly selected Story element from the Storying module.
      # i.e. `has_randomized_story_element :name` creates methods equivalent to the following:
      #  def name
      #     @name ||= StoryElements.names.random
      #  end
      def has_randomized_story_element(*properties)
        properties.each do |property|
          define_method property.to_sym do
            unless value = instance_variable_get("@#{property}".to_sym)
              # FIXME poor man's pluralization
              value = StoryElements.send("#{property}s").random
              instance_variable_set("@#{property}", value)
            end
            value
          end
        end
      end
    end
  end
end