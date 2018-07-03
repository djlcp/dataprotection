class Category < ApplicationRecord
  belongs_to :group
  has_many :articles
  #an artuicle acn belong to multiuple catogories

  def self.search(search)
      where("title LIKE ?", "%#{search}%")
  end

end
