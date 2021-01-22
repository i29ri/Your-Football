# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/css/teams_index.csv', headers: true) do |row|
  Team.create(
    name: row['name'],
    image_id: File.open(row['image_id']),
  )
end

CSV.foreach('db/css/team-relationships_index.csv', headers: true) do |row|
  TeamRelationship.create(
    team_id: row['team_id'],
    match_id: row['match_id'],
    home_flg: row['home_flg'],
  )
end

CSV.foreach('db/css/matches_index.csv', headers: true) do |row|
  Match.create(
    match_day: row['match_day'],
    home_goal: row['home_goal'],
    away_goal: row['away_goal'],
    home_points: row['home_points'],
    away_points: row['away_points'],
    stadium_name: row['stadium_name'],
    is_held: row['is_held'],
    season: row['season'],
    section: row['section'],
  )
end

user = User.new(:email => 'test@test.com', :password => 'testtest', :yourfoot_ID => 'testtest', :nickname => 'testtest')
user.save!