%w(rubygems bundler/setup chance yaml erb sinatra thin sinatra/reloader).each {|library| require library}

module Storying
  ROOT = File.dirname(__FILE__)
  STORY_ELEMENTS_PATH = ROOT + "/story_elements"
  LIB_PATH = ROOT + "/lib/storying/"
  TEMPLATE_PATH = ROOT + "/templates"
  TEMPLATES = Dir.glob(TEMPLATE_PATH + "/*.erb").map {|f| File.read f}

  Dir.entries(LIB_PATH).sort.each do |filename|
    require File.join(LIB_PATH, filename) if filename =~ /\.rb$/
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
    erb TEMPLATES.random, :layout => :layout
  end

  configure do |c|
    c.also_reload "*.rb"
    c.also_reload "*.yml"
    c.also_reload "*.erb"
  end

end