json.array!(@images) do |image|
  json.extract! image, :id, :user_id, :name, :title, :detail, :file
  json.url image_url(image, format: :json)
end
