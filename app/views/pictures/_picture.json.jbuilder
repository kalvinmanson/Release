json.extract! picture, :id, :user_id, :book_id, :post_id, :created_at, :updated_at
json.url picture_url(picture, format: :json)