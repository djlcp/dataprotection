class Frontend::HomeController < FrontendController
  def index
  end

  def authority
  end

  def regulations_dp
  	@articles = []
  	categories=Category.where(group_id = '1')
  	categories.each do |category|
  		articles=Article.where(category_id: category.id)
  		@articles += articles
  	end
  end

  def dplaws
  end
end
