json.extract! comment, :id, :book_id, :post_id, :user_id, :parent_id, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)