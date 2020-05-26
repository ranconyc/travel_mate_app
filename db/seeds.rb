# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CATEGORIES = ['Night Life', 'Beach', 'Nature', 'Food', 'Site Seeing', 'Sports', 'Classes', 'Next Destination', 'Culture', 'Music']
VIBES = ['Chill', 'Pump', 'Explore', 'Fun', 'Heavy', 'GVO']
GENDERS = ['Male', 'Female', 'Non-Binary']
LANGUAGES = ['English', 'Hebrew', 'French', 'German', 'Spanish', 'Arabic', 'Russian', 'Portuguese', 'Greek', 'Italian']
puts 'Adding seed data...'
puts 'Creating users...'

#   BIKE_PHOTOS = {
#   'BMX Bike': URI.open('https://i1.adis.ws/i/washford/143184/X-Rated-Exile-BMX--Bike---24-Wheel.webp?$sfcc_tile$&w=456'),
#   'City Bike': URI.open('https://cdn.webshopapp.com/shops/212063/files/126309038/6ku-odessa-8spd-city-bike-pershing-gold.jpg'),
#   'Electric Bike': URI.open('https://img.gkbcdn.com/s3/p/2019-10-23/onebot-s6-folding-electric-bike-250w-motor-max-25km-h-orange-1574132777187.jpg')
# }


ACTIVITIES = [
  {
    title: 'bar hopping',
    date: '2020-06-24',
    description: 'Looking for someone to have good time with and to visit the bars in the area',
    category: 'Night Life',
    vibe: 'Pump',
    group_size: 2,
    location: 'Ayia Napa, Cyprus'
  },
  {
    title: 'scuba diving',
    date: '2020-05-24',
    description: 'Who wants to go scuba diving with me??',
    category: 'Sports',
    vibe: 'GVO',
    group_size: 3,
    location: 'Bahamas'
  },
  {
    title: 'party today at bali',
    date: '2020-05-2',
    description: 'Join me at the party tonight. Only girls, thanks!',
    category: 'Night Life',
    vibe: 'Pump',
    group_size: 4,
    location: 'Bali'
  },
    {
    title: 'trek to machu pichu',
    date: '2020-06-15',
    description: "It costs like 100$ for 5 days. Let me know if you'd like to join me and we can split costs",
    category: 'Nature',
    vibe: 'Explore',
    group_size: 5,
    location: 'Machu Pichu, Peru',
    price: 100
  },
  {
    title: 'who wants to go to the temples?',
    date: '2020-07-17',
    description: "It's pretty far and i'm looking to split costs on the cab",
    category: 'Culture',
    vibe: 'Chill',
    group_size: 3,
    location: 'Bagan, Myanmar'
  },
  {
    title: 'looking for a surf buddy',
    date: '2020-05-22',
    description: 'Come and surf with me. 20-30',
    category: 'Beach',
    vibe: 'GVO',
    group_size: 2,
    location: 'Byron Bay, Australia'
  },
    {
    title: 'rome museum',
    date: '2020-05-23',
    description: 'Roman history is so interesting, lets go together... Hit me up!',
    category: 'Culture',
    vibe: 'Heavy',
    group_size: 2,
    location: 'Rome, Italy',
    price: 20
  },
  {
    title: 'go to pishpeshim market',
    date: '2020-06-01',
    description: "Looking forward to go to the pishpeshim market with a fellow american. talk to me :)",
    category: 'Food',
    vibe: 'Chill',
    group_size: 3,
    location: 'Jaffa, Israel'
  },
  {
    title: 'full moon partner',
    date: '2020-05-28',
    description: "Let's go partying tonight. Got some alcohol to fuel ;)",
    category: 'Night Life',
    vibe: 'Pump',
    group_size: 5,
    location: 'Koh Phangan, Thailand'
  },
  {
    title: 'trek at sahara desert',
    date: '2020-05-31',
    description: "There's something magical about this place. English speakers only!!!",
    category: 'Nature',
    vibe: 'Explore',
    group_size: 2,
    location: 'Morocco',
    price: 50
  }
]

  # BIKES = BIKES.map do |bike|
  #   new_bike = Bike.new(bike)
  #   new_bike.photos.attach(io:BIKE_PHOTOS[bike[:category]], filename: "bike#{i}.png", content_type: 'image/png')
  # end

10.times do
  email = Faker::Internet.email
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  gender = GENDERS.sample
  age = rand(18..65)
  language = LANGUAGES.sample

  activity_sample = ACTIVITIES.sample

  new_user = User.new(email: email, password:'123456', first_name: first_name, last_name: last_name, gender: gender, age: age,
                      location: activity_sample[:location], language: language)
  new_user.save!

  activity_sample[:user] = new_user
  new_activity = Activity.new(activity_sample)
  new_activity.save
end

all_activities = Activity.all

10.times do
  new_member = Member.new(user: all_activities.sample.user, activity: all_activities.sample, status: 'accept')
  new_member.save!
end

# presenter = User.new(email: 'ran@bob.bob', password: '123456', first_name: 'Ran', last_name: 'Cohen')
# puts 'Done.'

# #BIKE_CATEGORIES
# #bikes to different users
# #category should match bike img
# #create rental for each user
