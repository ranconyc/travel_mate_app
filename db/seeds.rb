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
  "https://i2.cdn.turner.com/cnn/2010/TECH/social.media/11/24/facebook.profile.shots.netiquette/t1larg.man.beer.jpg",

  "https://i.pinimg.com/236x/fe/dd/a6/fedda6e0a168a1cabad3c71b61c47c7b.jpg",
  "https://lh3.googleusercontent.com/proxy/BhfUkC96M1oOtvhj7GwwygvPrzO1SyUR-8pmWXYPBYiVzI-dWNEMM8AHu87z5l9uGb-DCMsJsPDnBJYRXuGMnBbEoSDbWEqb0reZYMwj7oTqprM3M9dBI6wFuXP3",
  "https://sa1s3optim.patientpop.com/assets/images/provider/photos/1776619.jpg",
  "https://freedesignfile.com/upload/2019/03/Beautiful-woman-face-makeup-artist-applies-eyeshadow-Stock-Photo-03.jpg",
  "https://i.pinimg.com/originals/5e/81/37/5e81371c890a88377dd2195a99d3deba.jpg",
  "https://images.pexels.com/photos/2787341/pexels-photo-2787341.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://i.pinimg.com/originals/9f/a6/e6/9fa6e69f9d7dcd86989c8254f1483be8.jpg",
  "https://www.yorkshireeveningpost.co.uk/webimg/QVNIMTE0MTI2NTgx.jpg",
  "https://i.pinimg.com/564x/5b/40/87/5b4087d0fc8d9d372c00a32bc08f818c.jpg",
  "https://i.pinimg.com/564x/77/5a/7c/775a7cd9606604bb5cf473cc19a69cf2.jpg",

  "https://api.time.com/wp-content/uploads/2019/04/katiebouman.jpg",
  "https://www.worldwomanfoundation.com/summit2018/wp-content/uploads/2018/09/Jeannette_Ceja-_Head_Shot_2018_0.jpg",
  "https://i2-prod.mirror.co.uk/incoming/article20665665.ece/ALTERNATES/s615/1_Laura7.jpg",
  "https://www.blackenterprise.com/wp-content/blogs.dir/1/files/2018/08/Mcdonalds-1023x675.jpg",
  "https://hackspirit.com/wp-content/uploads/2017/08/woman-female.jpg",
  "https://i.pinimg.com/originals/8a/6e/9c/8a6e9c20393cf96a1955bdc3741fa5ac.jpg",
  "https://i.pinimg.com/736x/39/e4/40/39e4407367449c4936077a7b14cdbb8b.jpg",
  "https://thewaxshop.com/wp-content/uploads/2016/05/men-face-waxing.jpg",
  "https://i.pinimg.com/474x/8a/fa/32/8afa32ba9f054509d560fee58f43f1ea.jpg",
  "https://i.pinimg.com/originals/41/c0/4a/41c04a35219d3ad407f785a6ee029dc4.jpg"
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
  },
# -----------------------------------------------------------------------for tel aviv----------------------------------------------------------------------------------------
  {
    title: 'visit dizengoff tonight',
    date: '2020-06-03',
    description: 'Looking for someone to have good time with and to visit the bars in the tlv tonight! join me',
    category: 'Night Life',
    vibe: 'Pump',
    group_size: 3,
    location: 'Tel Aviv, Israel'
  },
  {
    title: 'Shalvata?',
    date: '2020-06-03',
    description: 'Who wants to go to Shalvata club tonight??',
    category: 'Night Life',
    vibe: 'Good Vibes Only',
    group_size: 2,
    location: 'Tel Aviv, Israel'
  },
  {
    title: 'party today at kuli alma',
    date: '2020-06-04',
    description: "i just arrived to israel and i don't know anyone here... who wants to go with me?",
    category: 'Night Life',
    vibe: 'Pump',
    group_size: 4,
    location: 'Tel Aviv, Israel'
  },
  {
    title: 'kuli!!!!',
    date: '2020-06-03',
    description: "join me. only girls 20-25 :)",
    category: 'Night Life',
    vibe: 'Explore',
    group_size: 5,
    location: 'Tel Aviv, Israel',
    price: 10
  },
  {
    title: 'frishman beach',
    date: '2020-07-17',
    description: "It's pretty far and i'm looking to split costs on the cab",
    category: 'Nature',
    vibe: 'Chill',
    group_size: 3,
    location: 'Tel Aviv, Israel'
  },
  {
    title: 'looking for a surf buddy',
    date: '2020-05-22',
    description: 'Come and surf with me. 20-30',
    category: 'Nature',
    vibe: 'Good Vibes Only',
    group_size: 2,
    location: 'Tel Aviv, Israel'
  },
  {
    title: 'tel aviv museum',
    date: '2020-06-05',
    description: 'Israeli history is so interesting, lets go together... Hit me up!',
    category: 'Culture',
    vibe: 'Heavy',
    group_size: 2,
    location: 'Tel Aviv, Israel',
    price: 5
  },
  {
    title: 'go to sarona market',
    date: '2020-06-03',
    description: "Let's get some food. I'm hungry :)",
    category: 'Food',
    vibe: 'Chill',
    group_size: 3,
    location: 'Tel Aviv, Israel'
  },
  {
    title: 'surf partner',
    date: '2020-06-03',
    description: "Going to surf today. Welcome to join me",
    category: 'Nature',
    vibe: 'Chill',
    group_size: 5,
    location: 'Tel Aviv, Israel'
  },
  {
    title: 'want to go to the beach',
    date: '2020-05-31',
    description: "There's something magical about this place. English speakers only!!!",
    category: 'Nature',
    vibe: 'Chill',
    group_size: 2,
    location: 'Tel Aviv, Israel',
    price: 0
  },

# -----------------------------------------------------------------------for amsterdam----------------------------------------------------------------------------------------
  {
    title: 'Van gogh museum',
    date: '2020-06-25',
    description: 'im going to the van gogh museum on the 28th. who wants to be of a company?',
    category: 'Culture',
    vibe: 'Pump',
    group_size: 3,
    location: 'Amsterdam, Netherlands'
  },
  {
    title: 'dam square?',
    date: '2020-06-26',
    description: 'Who wants to go to the Dam Square to get some IG photos?',
    category: 'Culture',
    vibe: 'Good Vibes Only',
    group_size: 2,
    location: 'Amsterdam, Netherlands'
  },
  {
    title: 'Chin Chin',
    date: '2020-06-27',
    description: "Going to visit chin chin club. who'll join me?",
    category: 'Night Life',
    vibe: 'Pump',
    group_size: 4,
    location: 'Amsterdam, Netherlands'
  },
  {
    title: 'travel partner?',
    date: '2020-06-27',
    description: "going to be in amsterdam on the 27th... looking for someone to hang out with",
    category: 'Travel',
    vibe: 'Explore',
    group_size: 5,
    location: 'Amsterdam, Netherlands',
    price: 10
  },
  {
    title: 'club church',
    date: '2020-06-04',
    description: "have anyone been there? looking to go for the first time with someone",
    category: 'Night Life',
    vibe: 'Pump',
    group_size: 3,
    location: 'Amsterdam, Netherlands'
  },
  {
    title: 'vondelpark partner',
    date: '2020-06-10',
    description: 'who wants to go there with me?',
    category: 'Nature',
    vibe: 'Good Vibes Only',
    group_size: 2,
    location: 'Amsterdam, Netherlands'
  },
  {
    title: 'anne frank house',
    date: '2020-06-05',
    description: 'looking to go there on the 5th. join me',
    category: 'Culture',
    vibe: 'Heavy',
    group_size: 2,
    location: 'Amsterdam, Netherlands',
    price: 5
  },
  {
    title: 'Westerstraat market',
    date: '2020-06-03',
    description: "Let's get some food. I'm hungry :)",
    category: 'Food',
    vibe: 'Chill',
    group_size: 3,
    location: 'Amsterdam, Netherlands'
  },
  {
    title: 'visit the amstel',
    date: '2020-06-07',
    description: "if you're american and looking to go there, we can go together",
    category: 'Nature',
    vibe: 'Chill',
    group_size: 5,
    location: 'Amsterdam, Netherlands'
  },
  {
    title: 'in Amsterdam on 26th',
    date: '2020-06-26',
    description: "English speakers only!!!",
    category: 'Travel',
    vibe: 'Chill',
    group_size: 2,
    location: 'Amsterdam, Netherlands'
  }
]

30.times do |i|
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

30.times do
  new_member = Member.new(user: all_activities.sample.user, activity: all_activities.sample, status: 'pending')
  new_member.save!
end
