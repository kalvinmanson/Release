json.extract! report, :id, :user_id, :comment_id, :book_id, :post_id, :caracter, :content, :created_at, :updated_at
json.url report_url(report, format: :json)