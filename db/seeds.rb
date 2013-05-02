
def create_users(num)
  num.times do 
    User.create(username: Faker::Name.first_name, email: Faker::Internet.email, password:"password")
  end
end
create_users(100)

def create_posts(num)
  users = User.all
  num.times do
    Post.create(title: Faker::Company.bs, body: Faker::Lorem.paragraphs.join("\n"), user: users.sample)
  end
end
create_posts(200)

def create_comments(num)
  users = User.all
  num.times do
    post = Post.first(:order => "RANDOM()")
    comment = Post.create(title: Faker::Company.bs, body: Faker::Lorem.paragraphs.join("\n"), user: users.sample)
    post.comments << comment
  end
end
create_comments(1000)