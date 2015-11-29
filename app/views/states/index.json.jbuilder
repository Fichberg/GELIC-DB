json.array!(@states) do |state|
  json.extract! state, :id, :nome, :country_id
  json.url state_url(state, format: :json)
end
