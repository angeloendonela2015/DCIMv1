json.extract! user, :id, :username, :firstname, :middlename, :lastname, :userinterface, :created_at, :updated_at
json.url user_url(user, format: :json)
