json.extract! notification, :id, :user_id, :rank_id, :paymment_id, :book_id, :caracter, :content, :checked, :created_at, :updated_at
json.url notification_url(notification, format: :json)