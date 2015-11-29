json.array!(@cities) do |city|
  json.extract! city, :id, :nome, :state_id, :country_id
  json.url city_url(city, format: :json)
end
