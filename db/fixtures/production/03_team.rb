csv = CSV.read('db/fixtures/production/teams_index.csv')
csv.each do |team|
  Team.seed do |s|
  s.id = team[0]
  s.name = team[1]
  s.image_id = team[2]
  end
end
