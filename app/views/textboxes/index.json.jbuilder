json.array!(@textboxes) do |textbox|
  json.extract! textbox, :id, :attributeDisplayId, :size
  json.url textbox_url(textbox, format: :json)
end
