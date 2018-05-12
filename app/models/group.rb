class Group < ApplicationRecord
  has_many :articles

  validates_uniqueness_of :title, :message => '%{value} already exists.'

end
