json.array!(@foods) do |food|
  json.extract! food, :id, :delivered_date, :content
  json.url food_url(food, format: :json)
end
