class ApplicationController < Sinatra::Base
  set :views, "app/views"

  get "/" do
    redirect "/sushis"
  end

  # get all sushis
  get "/sushis" do
    @sushis = Sushi.all
    erb :index
  end

  # render form to create a sushi
  get "/sushis/new" do
    erb :new
  end

  # get one sushi
  get "/sushis/:id" do
    @sushi = Sushi.find(params[:id])
    puts @sushi
    erb :show
  end

  # edit one sushi
  get "/sushis/:id/edit" do
    @sushi = Sushi.find(params[:id])
    erb :edit
  end

  # create a sushi
  post "/sushis" do
    sushi = Sushi.create(name: params[:name], description: params[:description])
    redirect "/sushis"
  end

  # delete a sushi
  patch "/sushis/:id" do
    sushi = Sushi.find(params[:id])
    sushi.update(name: params[:name], description: params[:description])
    redirect "/"
  end

  # delete a sushi
  delete "/sushis/:id" do
    @sushi = Sushi.find(params[:id])
    @sushi.delete
    redirect "/"
  end

end
