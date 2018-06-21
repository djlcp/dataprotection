class Message
	include ActiveModel::Model

	attr_accessor :full_name, :email, :body, :subject_line
 	validates :full_name, :email, :body, :subject_line, presence: true

end

