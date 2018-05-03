class Article < ApplicationRecord
  belongs_to :category
  #has_and_belongs_to_many :articles
  #has_many :articles, through: :articles_connections
  has_many :linked_articles, foreign_key: 'article_a_id', class_name: 'Article'
  #has_many :articles, through: :linked_articles
  #has_many :articles, through: :linked_articles

  #has_many :linked_articles
  #has_many :articles, through: :linked_articles
end
