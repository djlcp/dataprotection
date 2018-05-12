class Category < ApplicationRecord
  belongs_to :group
  has_many :articles
  # an article can belong to multiple categories

  validates_uniqueness_of :title, scope: :group_id, :message => '%{value} already exists for this Group.'

end
