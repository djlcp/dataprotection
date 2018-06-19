json.extract! article, :id, :title, :content, :number, :views, :category_id, :created_at, :updated_at
json.category_title article.category.title
json.group_title article.category.group.title
json.url articles_url(article, format: :json)
