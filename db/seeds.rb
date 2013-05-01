10.times do
  User.create(:username => Faker::Name.first_name, :password=> 'test', :email => Faker::Internet.email)
end

10.times do
  Post.create(:title => Faker::Lorem.word, :body => Faker::Lorem.sentence, :user_id => rand(1..10))
end
