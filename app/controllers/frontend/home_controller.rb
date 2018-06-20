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
    @groups=Group.all
  end

  
  private

  def message_params
      message_params = params.require(:message).permit(:full_name, :email, :body, :subject_line)
  end
  

end
