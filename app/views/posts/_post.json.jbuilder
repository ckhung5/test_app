json.extract! post, :id, :string, :text, :created_at, :updated_at
json.url post_url(post, format: :json)