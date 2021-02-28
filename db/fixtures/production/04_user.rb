csv = CSV.read('db/fixtures/production/users_index.csv')
csv.each do |user|
  User.seed do |s|
  s.id = user[0]
  s.email = user[1]
  s.encrypted_password = user[2]
  s.yourfoot_ID = user[3]
  s.nickname = user[4]
  s.introduction = user[5]
  s.admin_flg = user[6]
  end
end