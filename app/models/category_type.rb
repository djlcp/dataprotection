class CategoryType < ApplicationRecord
  belongs_to :category
  # an article can belong to multiple categories

  validates_uniqueness_of :category_type_desc, :message => '%{value} already exists.'

end
