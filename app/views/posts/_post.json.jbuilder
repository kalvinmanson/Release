json.extract! post, :id, :category_id, :book_id, :user_id, :name, :slug, :content, :description, :tags, :created_at, :updated_at
json.url post_url(post, format: :json)