json.array!(@fields) do |field|
  json.extract! field, :id, :modelid, :schema, :tablename, :field
  json.url field_url(field, format: :json)
end
