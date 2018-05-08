class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show]
  load_and_authorize_resource

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @categories = Category.all
    @groups = Group.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

end

