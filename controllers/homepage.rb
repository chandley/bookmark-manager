class Server 
  get '/' do
      @links = Link.all
      erb :index
  end
end