json.array!(@records_formats) do |records_format|
  json.extract! records_format, :id, :name, :classname, :type
  json.url records_format_url(records_format, format: :json)
end
