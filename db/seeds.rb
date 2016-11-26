User.create(email: "tom@cruise.com", password: "123456")

5.times do
  User.create(
    email: Faker::Internet.email,
    password: "123456",
    avatar: Pathname.new(Rails.root + "app/assets/images/avatar/#{rand(1..6)}.jpg").open
  )
  puts "Created 1 user"
end

User.all.each do |user|
  5.times do
    listing = user.listings.create(
      title: Faker::Address.street_name,
      description: Faker::Lorem.paragraph(2),
      price: rand(50..500),
      city: Faker::Address.city,
      country: Faker::Address.country,
      bed_no: rand(1..4)
    )
    listing.photos = [Pathname.new(Rails.root + "app/assets/images/listings/#{rand(1..12)}.jpg").open]
    listing.save!
    puts "Created 1 listing"
  end
end