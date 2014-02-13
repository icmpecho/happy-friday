json.array!(@food_finder_teams) do |food_finder_team|
  json.extract! food_finder_team, :id, :name, :weight
  json.url food_finder_team_url(food_finder_team, format: :json)
end
