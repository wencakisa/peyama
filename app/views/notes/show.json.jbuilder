json.note do
  json.extract! @note, :text
  json.url note_url(@note, format: :json)
end
