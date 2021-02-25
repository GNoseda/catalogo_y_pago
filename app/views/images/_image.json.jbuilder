json.extract! image, :id, :url, :digital_id, :product_id, :created_at, :updated_at
json.url image_url(image, format: :json)
