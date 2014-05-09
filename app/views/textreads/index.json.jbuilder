json.array!(@textreads) do |textread|
  json.extract! textread, :id, :attributeDisplayId, :truncation, :truncation_format, :transformation
  json.url textread_url(textread, format: :json)
end
