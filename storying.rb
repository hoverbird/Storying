%w(rubygems bundler/setup chance yaml erb sinatra).each {|library| require library}

module Storying
  ROOT = File.dirname(__FILE__)
  STORY_ELEMENTS_PATH = ROOT + "/story_elements"
  LIB_PATH = ROOT + "/lib/storying/"
  TEMPLATE_PATH = ROOT + "/templates"
  TEMPLATES = Dir.glob(TEMPLATE_PATH + "/[^layout]*.erb").map {|f| f.split('/')[-1].split('.')[0].to_sym }

  set :views, Proc.new { TEMPLATE_PATH }

  configure(:development) do |config|
    require "sinatra/reloader"
    config.also_reload LIB_PATH + "/*.rb"
  end

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
    erb TEMPLATES.random, :layout => File.read(TEMPLATE_PATH + '/layout.html.erb')
  end

end