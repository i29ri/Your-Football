csv = CSV.read('db/fixtures/development/team-relationships_index.csv')
csv.each do |team_relationship|
  TeamRelationship.seed do |s|
  s.id = team_relationship[0]
  s.match_id = team_relationship[1]
  s.team_id = team_relationship[2]
  s.home_flg = team_relationship[3]
  end
end
