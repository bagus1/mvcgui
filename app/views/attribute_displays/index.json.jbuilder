json.array!(@attribute_displays) do |attribute_display|
  json.extract! attribute_display, :id, :attributeid, :format, :action, :header
  json.url attribute_display_url(attribute_display, format: :json)
end
