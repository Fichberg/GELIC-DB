json.array!(@countries) do |country|
  json.extract! country, :id, :nome
  json.url country_url(country, format: :json)
end
