class Message
	include ActiveModel::Model

	attr_accessor :full_name, :email, :body
 	validates :full_name, :email, :body, presence: true

end

