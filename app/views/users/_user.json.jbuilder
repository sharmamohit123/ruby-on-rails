json.extract! user, :id, :name, :email, :password, :salt, :created_at, :updated_at
json.url user_url(user, format: :json)
