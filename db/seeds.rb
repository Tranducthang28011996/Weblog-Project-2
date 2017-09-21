User.create! username: "Admin",
             email: "admin@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: 1,
             avatar: Faker::Avatar.image("my-own-slug", "150x150", "jpg"),
             confirmed_at: Time.zone.now,
             address: Faker::Address.street_address

30.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  password = "123123"
  avatar = Faker::Avatar.image("my-own-slug", "150x150", "jpg")
  address = Faker::Address.street_address
  User.create! username: name,
               email: email,
               password: "123123",
               password_confirmation: "123123",
               role: 0,
               avatar: avatar,
               confirmed_at: Time.zone.now,
               address: address
end

users = User.order(:created_at).take 6
15.times do
  title = Faker::Lorem.sentence 5
  content = Faker::Lorem.sentence 500
  image = Faker::Avatar.image("my-own-slug")
  users.each{|user| user.posts.create! content: content, title: title, image: image}
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each{|followed| user.follow followed}
followers.each{|follower| follower.follow user}
