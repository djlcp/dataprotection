class Infographic < ApplicationRecord
	has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates :image, presence: true
end
