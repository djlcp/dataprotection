class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit]
  before_action :set_category, only: [:index]
  before_action :set_form, only: [:new, :create, :edit, :index]
  load_and_authorize_resource

  def index
    if params[:search]
      @articles = Article.search(params[:search])
    else
      @articles = @category.articles
    end
  end

  def show; end

  def new
    @article = Article.new()
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    if @article.save
      create_associated_articles
      redirect_to action: "show", id: @article.id
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      create_associated_articles
      redirect_to admin_articles_path, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path, notice: 'Article was successfully destroyed.'
  end

  private

  def set_form
    @form_params = OpenStruct.new(params.permit(:law, :type))
  end

  def set_category
    if params.to_unsafe_h[:scope].present?
      @category = Category.find(params.to_unsafe_h[:scope].to_i)
    else
      @category = Category.first
    end
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    # params.require(:article).permit(:title, :content, :number, :views, :category_id, article_a_ids: [])
    params.require(:article).permit(
      :title,
      :letter,
      :content,
      :number,
      :article_type,
      :published,
      :views,
      :category_id
    )
  end

  def create_associated_articles
    associated_article_ids.each do |num|
      @article.linked_articles.create(
        article_id: num,
        article_a_id: @article.id
      )
    end
  end

  def associated_article_ids
    if params.to_unsafe_h[:article][:associated_article_ids].present?
      params.to_unsafe_h[:article][:associated_article_ids].reject!(&:empty?)
    else
      []
    end
  end
end
