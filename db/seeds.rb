User.create! username: "Admin",
             email: "admin@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: 1,
             avatar: File.open(Rails.root.join("app", "assets",
               "images", "seed", "1.jpg")),
             confirmed_at: Time.zone.now,
             address: Faker::Address.street_address

5.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  password = "123123"
  address = Faker::Address.street_address
  User.create! username: name,
               email: email,
               password: "123123",
               password_confirmation: "123123",
               role: 0,
               avatar: File.open(Rails.root.join("app", "assets",
                 "images", "seed", "#{rand(1..9).to_s}.jpg")),
               confirmed_at: Time.zone.now,
               address: address
end

users = User.order(:created_at).take 6
5.times do
  title = Faker::Lorem.characters 10
  content = Faker::Lorem.sentence 10
  users.each{|user| user.posts.create! content: content, title: title,
    image: File.open(Rails.root.join("app", "assets",
      "images", "seed", "#{rand(1..9).to_s}.jpg"))}
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each{|followed| user.follow followed}
followers.each{|follower| follower.follow user}
