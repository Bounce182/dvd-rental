json.array!(@user_dvds) do |user_dvd|
  json.extract! user_dvd, :id, :dvd_id, :user_id, :rent_date, :return_date, :total_price, :returned
  json.url user_dvd_url(user_dvd, format: :json)
end
