module Storying
  module StoryElements

    STORY_ELEMENTS_PATH = ROOT + "/story_elements"
    class << self
      def included(base)
        base.extend(ClassMethods)
      end
    end

    module ClassMethods
      # Creates an accessor  returning a randomly selected Story element from the Storying module.
      # i.e. `has_random_story_element :name` creates methods equivalent to the following:
      #
      # def name
      #   @name ||= names.random
      # end
      def has_random_story_element(*properties)
        options = properties.extract_options!
        puts options.inspect
        properties.each do |property|
          define_method property.to_sym do
            unless value = instance_variable_get("@#{property}".to_sym)
              collection = send("#{property}s") # FIXME poor man's pluralization
              if options[:unique]
                value = collection.random_pop
              else
                value = collection.random
              end
              instance_variable_set("@#{property}", value)
            end
            value
          end
        end
      end      
    end

    # Parse all of the story_elements YAML files and make accessor methods by filename
    Dir.open(STORY_ELEMENTS_PATH) do |dir|
      dir.each do |filename|
        next unless filename =~ /\.yml$/
        element_name = filename.gsub('.yml', '').to_sym
        elements = YAML.load_file(File.join(STORY_ELEMENTS_PATH, filename))
        define_method element_name do
          unless instance_variable_defined? "@#{element_name}"
            instance_variable_set "@#{element_name}", elements
          else
            instance_variable_get "@#{element_name}"
          end
        end
      end
    end

  end
end