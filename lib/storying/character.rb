module Storying
  require File.join(LIB_PATH, 'character_attributes')
  require File.join(LIB_PATH, 'gender')

  class Character
    include CharacterAttributes
    include Gender

    def self.randomize_character_traits(*properties)
      properties.each do |property|
        define_method property.to_sym do
          unless value = instance_variable_get("@#{property}".to_sym)
            # FIXME poor man's pluralization
            value = Storying.send("#{property}s").random
            instance_variable_set("@#{property}", value)
          end
          value
        end
      end
    end

    def initialize(options = {})
      # raise "You can't have a Character without a Story!" unless options[:story]
      options.each_pair do |key, value|
        instance_variable_set "@#{key}", value
      end
    end

  end
end