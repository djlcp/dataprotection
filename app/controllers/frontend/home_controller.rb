class Frontend::HomeController < FrontendController
  def index
  end

  def dp_laws
        @articles = []
    categories=Category.where('group_id = 1')
    categories.each do |category|
      articles=Article.where(category_id: category.id).where(published: true)
      @articles += articles
    end

    @groups=Group.all
  end

  def authority_dp
        @articles = []
    categories=Category.where('group_id = 2')
    categories.each do |category|
      articles=Article.where(category_id: category.id).where(published: true)
      @articles += articles
    end

    @groups=Group.all
  end

  def regulations_dp
  	@articles = []
  	categories=Category.where('group_id = 3')
  	categories.each do |category|
  		articles=Article.where(category_id: category.id).where(published: true)
  		@articles += articles
  	end

    @groups=Group.all
  end

  def search_all
      @articles = Article.search(params[:search])
  
      # @articles = []
      # categories=Category.all
    	# categories.each do |category|
      #   articles=Article.where(published: true).all.search(params[:search])
      #   @articles += articles
      # end

    @groups=Group.all
  end

end
