json.array!(@dvds) do |dvd|
  json.extract! dvd, :id, :title, :description, :year, :lang, :length, :rent_price
  json.url dvd_url(dvd, format: :json)
end
