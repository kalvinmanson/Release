json.extract! user, :id, :city_id, :name, :slug, :avatar, :rol, :rank, :gender, :bithdate, :banned, :banned_date, :active, :created_at, :updated_at
json.url user_url(user, format: :json)