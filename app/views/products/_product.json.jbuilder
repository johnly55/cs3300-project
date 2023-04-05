json.extract! product, :id, :title, :description, :qty, :qty_reserved, :image_link, :created_at, :updated_at
json.url product_url(product, format: :json)
