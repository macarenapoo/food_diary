json.array!(@entries) do |entry|
  json.extract! entry, :id, :date, :time, :food, :situation
  json.url entry_url(entry, format: :json)
end
