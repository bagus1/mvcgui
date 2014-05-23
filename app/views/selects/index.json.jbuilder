json.array!(@selects) do |select|
  json.extract! select, :id, :attributeDisplayId, :model, :field, :collection, :value_method, :text_method, :data_size, :include_blank
  json.url select_url(select, format: :json)
end
