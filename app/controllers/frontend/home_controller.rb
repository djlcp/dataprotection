class Frontend::HomeController < FrontendController

  def index
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      MessageMailer.contact_us(@message).deliver_now
      redirect_to root_path, notice: "Thanks for contacting us, we'll get back to you soon"
    else
      render :new
    end
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
    @articles = Article.search(params[:search]).where(published: true)
    # group by group_id going via category_id
# .sort_by(group.id)
    objects = Group.all.map do |group|
      OpenStruct.new(id: group.id, title: group.title)
    end
    @objects = objects.map do |object|
      object.categories = Category.where(group_id: object.id).map do |category|
        OpenStruct.new(
          # category: category,
          category: category,

          articles: @articles.where(category_id: category.id)
        )
      end
      object
    end
    # pp @objects
  end


  private

  def message_params
    message_params = params.require(:message).permit(:full_name, :email, :body)
  end
end
