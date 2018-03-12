class ApplicationController < Sinatra::Base
  set :views, "app/views"

  get "/" do
    erb :index
  end

  get "/i-wanna-redirect" do
    redirect "/"
  end
end
