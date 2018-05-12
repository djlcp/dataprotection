class Article < ApplicationRecord
  belongs_to :category
  #has_and_belongs_to_many :articles
  #has_many :articles, through: :articles_connections

  has_many :linked_articles, foreign_key: 'article_a_id', class_name: 'LinkedArticle'
  has_many :associated_articles, through: :linked_articles, source: :associated_article

  has_many :link_articles, class_name: 'LinkedArticle', foreign_key: 'article_id'
  has_many :articles, through: :linked_articles

  #has_many :linked_articles
  #has_many :articles, through: :linked_articles

  validates_uniqueness_of [:number], scope: [:category_id, :letter], :message => '%{value} already exists for this Category.'

  # before_validation :combined_params
  #
  # validates_uniqueness_of [:number_letter], scope: [:category_id], :message => '%{value} already exists for this Category.'
  #
  # def combined_params
  #   number_letter = :number.to_s + :letter.to_s;
  # end

end
