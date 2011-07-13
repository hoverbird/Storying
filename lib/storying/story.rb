module Storying
  class Story
    attr_reader :setting, :hero, :supporting_character

    # Parse all of the story_elements YAML files and make accessor methods by filename
    class << self
      Dir.open(STORY_ELEMENTS_PATH) do |dir|
        dir.each do |entry|
          next unless entry =~ /\.yml$/
          story_element_kind = entry.gsub('.yml', '').to_sym
          define_method(story_element_kind) { YAML.load_file(File.join(STORY_ELEMENTS_PATH, entry)) }
        end
      end
    end

    def initialize
      @setting = Story.settings.random
      @hero = Hero.new(self)
      @supporting_character = SupportingCharacter.new(self)
    end

  end

end