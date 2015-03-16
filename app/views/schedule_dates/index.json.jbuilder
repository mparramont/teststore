json.array!(@schedule_dates) do |schedule_date|
  json.extract! schedule_date, :id, :time, :user_id, :type
  json.url schedule_date_url(schedule_date, format: :json)
end
