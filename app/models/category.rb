class Category < ApplicationRecord
  belongs_to :group
  has_many :articles
  #an artuicle acn belong to multiuple catogories
end
