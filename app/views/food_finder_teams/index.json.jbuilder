json.array!(@food_finder_teams) do |food_finder_team|
  json.extract! food_finder_team, :name, :weight
  json.members(food_finder_team.members) do |member|
    json.name member.name
    json.irc_name member.nickname
  end
end
