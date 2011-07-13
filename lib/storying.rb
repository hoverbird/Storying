%w(rubygems chance yaml erb sinatra).each {|library| require library}
STORY_ELEMENTS_PATH = File.expand_path(File.dirname(__FILE__) + "/../story_elements")
TEMPLATE_PATH =  File.expand_path(File.dirname(__FILE__) + "/../templates")


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

  module CharacterAttributes
    def initialize(story)
      @story = story
    end

    def gender
      @gender ||= ['female', 'male'].random
    end

    def characteristic
      @characteristic ||= Story.characteristics.random
    end

    def relationship_to_setting
      @relationship ||= [Story.relationships_to_setting.random, @story.setting].join(' ')
    end
  end

  class Hero
    include CharacterAttributes
  end

  class SupportingCharacter
    include CharacterAttributes

    def villain?
      @villain ||= 10.percent.chance.happens?
    end
  end

  get '/' do
    template = ERB.new(File.read(TEMPLATE_PATH + '/template.erb'))
    template.result
  end

end