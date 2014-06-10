json.array!(@languages) do |language|
  json.extract! language, :id, :title
  json.url language_url(language, format: :json)
end
