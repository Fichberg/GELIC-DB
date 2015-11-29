json.array!(@transcriptions) do |transcription|
  json.extract! transcription, :id, :id, :codigo, :comentario, :media_id, :city_id
  json.url transcription_url(transcription, format: :json)
end
