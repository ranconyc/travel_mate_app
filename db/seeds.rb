require "open-uri"


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all users, activities & languages "
Activity.destroy_all
UserLanguage.destroy_all
Language.destroy_all
User.destroy_all

CATEGORIES = ['Night Life', 'Nature', 'Food', 'Sport', 'Workshops', 'Travel', 'Culture']
VIBES = ['Chill', 'Pump', 'Explore', 'Fun', 'Heavy', 'Good Vibes Only']
GENDERS = ['Male', 'Female', 'Non-Binary']
LANGUAGES = ['English', 'Hebrew', 'French', 'German', 'Spanish', 'Arabic', 'Russian', 'Portuguese', 'Greek', 'Italian']
URLS = [
  "https://images.unsplash.com/photo-1530645298377-82c8416d3f90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
  "https://persianainc.com/wp-content/uploads/2018/10/face-7.jpg",
  "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
  "https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70",
  "https://images.squarespace-cdn.com/content/v1/52a1b3bfe4b05a96c7788819/1454769090216-2Y2R9UJTQBWVXC0FY7I1/ke17ZwdGBToddI8pDm48kNu93_l1Rc0JoXikXAEKHf17gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmDJyaVitQ06bkWUY0OMxkmN-bdz7wg8la12Me-ub45vBE5029s6uMXtkNCzVgxK8m/Andrijana-Belovic.jpg",
  "https://gobnewsonline.com/wp-content/uploads/2019/09/artists-create-more-than-100000-ultra-realistic-ai-portraits.jpg",
  "https://miro.medium.com/max/2048/0*0fClPmIScV5pTLoE.jpg",
  "https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859",
  "https://manofmany.com/wp-content/uploads/2019/06/50-Long-Haircuts-Hairstyle-Tips-for-Men-5.jpg",
  "https://i2.cdn.turner.com/cnn/2010/TECH/social.media/11/24/facebook.profile.shots.netiquette/t1larg.man.beer.jpg"
]

# For Language objects we will create:
languages = []

puts 'Adding seed data...'

puts 'Creating languages...'

LANGUAGES.each do |language|
  languages << Language.create!(name: language)
end


puts 'Creating users...'

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
    category: 'Sport',
    vibe: 'Good Vibes Only',
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
    title: 'temple trip?',
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
    category: 'Nature',
    vibe: 'Good Vibes Only',
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

10.times do |i|
  p i
  email = Faker::Internet.email
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  gender = GENDERS.sample
  date_of_birth = Faker::Date.in_date_period(year: 1950 + (0..52).to_a.sample)
  hometown = Faker::Address.city
  # activity_sample = ACTIVITIES.sample
  activity_sample = ACTIVITIES[i-1]

  user_avatar = URI.open(URLS[i])
  new_user = User.new(email: email, password:'123456', first_name: first_name, last_name: last_name, gender: gender, date_of_birth: date_of_birth,
                      location: activity_sample[:location], hometown: hometown)

  new_user.avatar.attach(io: user_avatar, filename: "user#{i+1}.jpg", content_type: 'image/jpg')
  new_user.save!

  # languages
  langs = languages.sample(rand(1..5))
  new_user.languages << langs

  activity_sample[:user] = new_user
  new_activity = Activity.new(activity_sample)
  new_activity.save!
end

all_activities = Activity.all

10.times do
  new_member = Member.new(user: all_activities.sample.user, activity: all_activities.sample, status: 'pending')
  new_member.save!
end
