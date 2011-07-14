%w(rubygems chance yaml erb sinatra).each {|library| require library}

module Storying
  STORY_ELEMENTS_PATH = File.expand_path(File.dirname(__FILE__) + "/../story_elements")
  TEMPLATE_PATH = File.expand_path(File.dirname(__FILE__) + "/../templates")
  LIB_PATH =  File.expand_path(File.dirname(__FILE__) + "/storying/")

  Dir.entries(LIB_PATH).sort.each do |filename|
    next unless filename =~ /\.rb$/
    require File.join(LIB_PATH, filename)
  end

  # Parse all of the story_elements YAML files and make accessor methods by filename
  class << self
    Dir.open(STORY_ELEMENTS_PATH) do |dir|
      dir.each do |filename|
        next unless filename =~ /\.yml$/
        story_element_kind = filename.gsub('.yml', '').to_sym
        define_method(story_element_kind) { YAML.load_file(File.join(STORY_ELEMENTS_PATH, filename)) }
      end
    end
  end

  get '/' do
    template = ERB.new(File.read(TEMPLATE_PATH + '/template.erb'))
    template.result
  end

end
