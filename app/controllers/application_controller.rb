
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    Article.create(params)
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles/new' do
    erb :new
  end

  

  get '/articles/:id/edit' do
    @articles = Article.find_by_id(params[:id])
    erb :edit  
  end

  get '/articles/:id' do
    @articles = Article.find_by_id(params[:id])
    erb :show
  end

  

  patch '/articles/:id' do
    @articles = Article.find_by_id(params[:id])
    
    @articles = @articles.update(params[:article])
    
    redirect "/articles/#{@articles.id}"
  end

  delete '/articles/:id/delete' do
    
    Article.delete(params[:id])
    erb :delete
  end

  

  

end
