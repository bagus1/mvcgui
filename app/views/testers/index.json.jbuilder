json.array!(@testers) do |tester|
  json.extract! tester, :id, :one, :two, :three
  json.url tester_url(tester, format: :json)
end
