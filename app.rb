ROOT = File.dirname(__FILE__)
LIB_PATH = File.join(ROOT, 'lib', 'storying')
$:.unshift LIB_PATH

%w(rubygems chance story_elements gender character storying).each {|library| require library}
%w(bundler/setup yaml erb sinatra/base thin).each {|library| require library}
Dir.entries(LIB_PATH).sort.each {|filename| require filename if filename =~ /\.rb$/ }

class MyApp < Sinatra::Base
  TEMPLATE_PATH = ROOT + "/templates"
  TEMPLATES = Dir.glob(TEMPLATE_PATH + "/*.erb").map {|f| File.read f}

  get 'hella' do
    'hell world'
  end

  get '/' do
    random_template = TEMPLATES.random
    begin
      erb TEMPLATES.random, :layout => :layout
    rescue => e
      raise "Error rendering #{random_template}:\n #{e}"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
