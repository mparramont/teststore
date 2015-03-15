json.array!(@pick_ups) do |pick_up|
  json.extract! pick_up, :id
  json.url pick_up_url(pick_up, format: :json)
end
