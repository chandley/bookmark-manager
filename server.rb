require 'sinatra/base'
require 'data_mapper'
env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager#{env}")

  require './lib/link'

DataMapper.finalize
DataMapper.auto_upgrade!

class Server < Sinatra::Base
  get '/' do
    'Hello Server!'
  end

  

 

  run! if app_file == $0
end
