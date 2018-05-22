class Group < ApplicationRecord
  # has_many :articles
  has_many :categories

  validates_uniqueness_of :title, :message => '%{value} already exists.'

end
