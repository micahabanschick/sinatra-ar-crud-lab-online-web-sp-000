
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do #loads new form
    erb :new
  end

  post '/articles' do  #creates a Article
    @article = Article.create(params)
  end 

  get '/articles' do #loads index page
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do  #loads show page
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do #loads edit form
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  post '/articles/:id' do  #updates a Article
    @article = Article.find_by_id(params[:id])
    @article.name = params[:name]
    @article.content = params[:content]
    @article.save
  end

  get '/articles/:id/delete' do 
    erb :delete
  end



  post '/articles/:id/delete' do #delete action
    @article = Article.find_by_id(params[:id])
    @article.delete
    redirect to '/articles'
  end
  
end
