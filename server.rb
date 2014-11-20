require 'sinatra/base'
require './lib/database.rb'
require './app/helpers/helpers'
require 'rack-flash'
require 'sinatra/partial'

class Server < Sinatra::Base

  include Helpers 
  use Rack::Flash

  configure do
    register Sinatra::Partial
    set :partial_template_engine, :erb
  end
  
  enable :sessions
  set :session_secret, 'super secret'
  set :views, Proc.new { File.join(root,  "/views") }

  run! if app_file == $0
end

%w{homepage links sessions users tags}.each {|page| require './controllers/' + page}

