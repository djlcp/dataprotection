class ArticlesController < ApplicationController

  before_action :set_article, only: [:show]
  load_and_authorize_resource

  # GET /articles
  # GET /articles.json
  def index
    if params[:search]
      @articles = Article.where(published: true).all.search(params[:search])
    else
      @articles = Article.where(published: true).all
    end
    @categories = Category.all
    @groups = Group.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  private
    def set_article
      @article = Article.where(published: true).find(params[:id])
        # catch error when someone changes article_ID in the url.
        rescue ActiveRecord::RecordNotFound
        flash[:notice] = "The selected ID is currenlty not publicly available."
        redirect_back fallback_location: articles_url
    end

end
