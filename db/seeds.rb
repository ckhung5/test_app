User.create(email: "tom@cruise.com", password: "123456")

5.times do
  User.create(
    email: Faker::Internet.email,
    password: "123456"
  )
  puts "Created 1 user"
end

User.all.each do |user|
  5.times do
    user.listings.create(
      title: Faker::Address.street_name,
      description: Faker::Lorem.paragraph(2),
      price: rand(50..500),
      city: Faker::Address.city,
      country: Faker::Address.country,
      bed_no: rand(1..4)
    )
    puts "Created 1 listing"
  end
end