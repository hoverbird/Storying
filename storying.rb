ROOT = File.dirname(__FILE__)
LIB_PATH = ROOT + "/lib/storying/"
$:.unshift LIB_PATH

%w(story_elements gender character).each {|library| require library}
%w(rubygems bundler/setup chance yaml erb sinatra thin).each {|library| require library}

module Storying
  TEMPLATE_PATH = ROOT + "/templates"
  TEMPLATES = Dir.glob(TEMPLATE_PATH + "/*.erb").map {|f| File.read f}

  Dir.entries(LIB_PATH).sort.each do |filename|
    require filename if filename =~ /\.rb$/
  end

  get '/' do
    random_template = TEMPLATES.random
    begin
      erb TEMPLATES.random, :layout => :layout
    rescue => e
      raise "Error rendering #{random_template}:\n #{e}"
    end
  end
end