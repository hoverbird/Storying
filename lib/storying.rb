%w(rubygems chance yaml erb sinatra).each {|library| require library}

module Storying
  STORY_ELEMENTS_PATH = File.expand_path(File.dirname(__FILE__) + "/../story_elements")
  TEMPLATE_PATH = File.expand_path(File.dirname(__FILE__) + "/../templates")
  LIB_PATH =  File.expand_path(File.dirname(__FILE__) + "/storying/")

  Dir.entries(LIB_PATH).sort.each do |file|
    next unless file =~ /\.rb$/
    require File.join(LIB_PATH, file)
  end

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

  get '/' do
    template = ERB.new(File.read(TEMPLATE_PATH + '/template.erb'))
    template.result
  end

end
