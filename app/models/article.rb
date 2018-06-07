class Article < ApplicationRecord
  belongs_to :category
  #has_and_belongs_to_many :articles
  #has_many :articles, through: :articles_connections

  enum article_type: { article: 1, recital: 2, guidance: 3 }

  has_many :linked_articles, foreign_key: 'article_a_id', class_name: 'LinkedArticle'
  has_many :associated_articles, through: :linked_articles, source: :associated_article

  has_many :link_articles, class_name: 'LinkedArticle', foreign_key: 'article_id'
  has_many :articles, through: :linked_articles

  #has_many :linked_articles
  #has_many :articles, through: :linked_articles

  def self.search(search)
      where("content LIKE ? OR title LIKE ?", "%#{search}%" , "%#{search}%")
  end
  def display_title
    "#{title} - #{category.group.title}"
  end
end
