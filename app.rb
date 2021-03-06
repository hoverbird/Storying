require 'bundler/setup'
ROOT = File.dirname(__FILE__)
LIB_PATH = File.join(ROOT, 'lib', 'storying')
MUSTACHE_PATH = File.join(ROOT, 'lib', 'mustache-0.99.4', 'lib')

$:.unshift LIB_PATH
$:.unshift MUSTACHE_PATH

require MUSTACHE_PATH + '/mustache'
%w(chance core_ext delegation story_elements uncanny_gift gender character storying).each {|library| require library}
%w(yaml mustache/sinatra sinatra/base story_view thin).each {|library| require library}
Dir.entries(LIB_PATH).sort.each {|filename| require filename if filename =~ /\.rb$/ }

class StoryingWebApp < Sinatra::Base
  register Mustache::Sinatra
  set :root, ROOT

  TEMPLATE_PATH = root + "/templates"
  TEMPLATES = Dir.glob(TEMPLATE_PATH + "/*.mustache").map do |file|
    next if file.match /layout.mustache$/
    file.split('/').last.split('.').first
  end.compact

  set :mustache, {
    :templates => TEMPLATE_PATH,
    :views =>  ROOT + "/views",
    :namespace => Storying
  }


  get '/' do
    redirect 'random'
  end

  get '/random' do
    mustache TEMPLATES.random
  end

  get '/:template' do
    mustache params[:template]
  end

  run! if app_file == $0 # start the server if ruby file executed directly
end
