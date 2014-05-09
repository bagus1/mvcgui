json.array!(@models) do |model|
  json.extract! model, :id, :classname, :schema, :tablename, :name
  json.url model_url(model, format: :json)
end
