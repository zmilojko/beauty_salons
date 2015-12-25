json.array!(@salons) do |salon|
  json.extract! salon, :id, :name, :address, :description, :lat, :lng
  json.url salon_url(salon, format: :json)
end
