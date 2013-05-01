10.times do
  User.create(:username => Faker::Name.first_name, :password_hash => 'test', :email => Faker::Internet.email)
end
