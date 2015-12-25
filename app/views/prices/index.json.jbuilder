json.array!(@prices) do |price|
  json.extract! price, :id, :price, :salon_id, :service_id
  json.url price_url(price, format: :json)
end
