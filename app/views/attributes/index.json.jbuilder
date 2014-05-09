json.array!(@attributes) do |attribute|
  json.extract! attribute, :id, :modelid, :schema, :tablename, :field
  json.url attribute_url(attribute, format: :json)
end
