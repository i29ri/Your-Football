csv = CSV.read('db/fixtures/development/matches_index.csv')
csv.each do |match|
  Match.seed do |s|
  s.id = match[0]
  s.match_day = match[1]
  s.season = match[2]
  s.section = match[3]
  s.stadium_name = match[4]
  s.is_held = match[5]
  s.home_goal = match[6]
  s.away_goal = match[7]
  s.home_points = match[8]
  s.away_points = match[9]
  end
end
