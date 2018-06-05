class Admin::ArticlesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_article, only: [:show]
  before_action :set_form, only: [:new, :create, :edit, :index]
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

  # GET /articles/new
  def new
    @article = Article.new
    @all_articles =  LinkedArticle.joins(:article, :article)
    @articles = Article.all

    # @form_belongs_to = @form_params.law
    # @form_type = @form_params.type
    @category = Category.new


  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @category = Category.new
    #@form_params = @form_params.all

    @article = Article.new(article_params)
    if @article.save
      create_associated_articles
      #redirect_to admin_articles_path(@article), notice: 'Article was successfully created.'
      #redirect_to admin_articles_path(:law => @form_params.law, :type => @form_params.type)
      #redirect_to admin_articles_path(@form_params)
      #redirect_to admin_articles_path(law: "#{@form_params.law}", type: "#{@form_params.type}")
      #redirect_to admin_articles_path(law: "#{@form_params.to_h[:law]}", type: "#{@form_params.to_h[:type]}")
      #redirect_to admin_articles_path(law: @form_params[:law], type: @form_params[:type])
      # law = @form_params.law
      # type = @form_params.type
      # redirect_to admin_articles_path(law: law, type: type)
      #redirect_to admin_articles_path(@form_params.to_h)
      #redirect_to action: "index", @form_params

      #redirect_to action admin_article_path(@article)
      #redirect_back fallback_location: { action: "show", id: @article.id }
      redirect_to action: "show", id: @article.id


    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.update(article_params)
      create_associated_articles
      redirect_to admin_articles_path, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_path, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_form
    if params.permit(:law, :type).present?
      @form_params = OpenStruct.new(params.permit(:law, :type))
    else
      @form_params = OpenStruct.new(law: 'gdpr-article', type: 'article')
    end
    #@form_params = params.permit(:law, :type)
    #@form_params = Struct.new(params.permit(:law, :type)).to_s
  end


  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    #params.require(:article).permit(:title, :content, :number, :views, :category_id, article_a_ids: [])
    params.require(:article).permit(:title, :letter, :content, :number, :article_type, :published, :views, :category_id)
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
