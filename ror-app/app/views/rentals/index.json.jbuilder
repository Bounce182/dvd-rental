json.array!(@rentals) do |rental|
  json.extract! rental, :id, :dvd_id, :user_id, :rent_date, :return_date, :total_price, :returned
  json.url rental_url(rental, format: :json)
end
