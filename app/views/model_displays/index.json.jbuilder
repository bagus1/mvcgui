json.array!(@model_displays) do |model_display|
  json.extract! model_display, :id, :modelid, :format, :action, :header
  json.url model_display_url(model_display, format: :json)
end
