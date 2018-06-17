json.extract! article, :id, :title, :content, :number, :views, :category_id, :created_at, :updated_at
json.url article_url(article, format: :json)
