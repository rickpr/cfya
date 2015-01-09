json.array!(@events) do |event|
  json.extract! event, :id, :day, :dinner, :lesson, :activity
  json.url event_url(event, format: :json)
end
