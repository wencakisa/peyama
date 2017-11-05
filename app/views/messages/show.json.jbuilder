json.message do
  json.extract! @message, :text
  json.url message_url(@message, format: :json)
end
