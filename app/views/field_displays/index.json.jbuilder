json.array!(@field_displays) do |field_display|
  json.extract! field_display, :id, :fieldid, :format, :action, :header
  json.url field_display_url(field_display, format: :json)
end
