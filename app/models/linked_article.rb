class LinkedArticle < ApplicationRecord
  #has_many :linked_articles, foreign_key: 'article_a_id', class_name: 'Article'
  belongs_to :article
end
