%w(rubygems bundler/setup chance yaml erb sinatra thin).each {|library| require library}

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
    random_template = TEMPLATES.random
    begin
      erb TEMPLATES.random, :layout => :layout
    rescue => e
      raise "Error rendering #{random_template}:\n #{e}"
    end
  end

  # def require_and_include(*libs)
  #   libs.each {|lib| require File.join(LIB_PATH, filename); include lib.constantize}
  # end

end