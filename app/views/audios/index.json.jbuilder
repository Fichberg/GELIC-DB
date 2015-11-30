json.array!(@audios) do |audio|
  json.extract! audio, :id, :codigo, :medium_id
  json.url audio_url(audio, format: :json)
end
