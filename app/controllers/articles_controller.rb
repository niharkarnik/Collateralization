class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "nihar", password: "secret",
   except: [ :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(params[:article])
    @article.save

    redirect_to @article
  end
end
