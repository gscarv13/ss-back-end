# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = FactoryBot.create(:user)
u2 = FactoryBot.create(:user)
u3 = User.create(first_name: "Hiro", last_name: "Sasaki", email: "sasaki@vagabond.jp", password: "12345678", password_confirmation: "12345678")

sn1_img = 'https://gitlab.com/api/v4/projects/32390679/repository/files/images%2Fsnb1.png/raw?ref=main'
sn2_img = 'https://gitlab.com/api/v4/projects/32390679/repository/files/images%2Fsnb2.png/raw?ref=main'
sn3_img = 'https://gitlab.com/api/v4/projects/32390679/repository/files/images%2Fsnb32.png/raw?ref=main'
sk1_img = 'https://gitlab.com/api/v4/projects/32390679/repository/files/images%2Fski1.png/raw?ref=main'
sk2_img = 'https://gitlab.com/api/v4/projects/32390679/repository/files/images%2Fsk2.png/raw?ref=main'
sk3_img = 'https://gitlab.com/api/v4/projects/32390679/repository/files/images%2Fsk3.png/raw?ref=main'

sn1 = Activity.create(title: 'L1 Raw', image:  sn1_img, activity_type: 'Snowboard', level: 'Beginner', description: Faker::Lorem.paragraph)
sn2 = Activity.create(title: 'L2 Rider', image: sn2_img, activity_type: 'Snowboard', level: 'Experienced', description: Faker::Lorem.paragraph)
sn3 = Activity.create(title: 'L3 Advanced', image: sn3_img, activity_type: 'Snowboard', level: 'Pro', description: Faker::Lorem.paragraph)
sk1 = Activity.create(title: 'L1 Novice', image: sk1_img, activity_type: 'Ski', level: 'Beginner', description: Faker::Lorem.paragraph)
sk2 = Activity.create(title: 'L2 Seasoned', image: sk2_img, activity_type: 'Ski', level: 'Experienced', description: Faker::Lorem.paragraph)
sk3 = Activity.create(title: 'L3 Advanced', image: sk3_img, activity_type: 'Ski', level: 'Pro', description: Faker::Lorem.paragraph)

d1 = Time.new(2021, 8, 23, 9, 00, 00).strftime '%Y/%m/%d %H:%M:%S'
d2 = Time.new(2021, 8, 23, 11, 00, 00).strftime '%Y/%m/%d %H:%M:%S'
d3 = Time.new(2021, 8, 24, 13, 30, 00).strftime '%Y/%m/%d %H:%M:%S'
d4 = Time.new(2021, 8, 24, 15, 30, 00).strftime '%Y/%m/%d %H:%M:%S'

Schedule.create(date: d1, activity_id: sn1.id, user_id: u.id)
Schedule.create(date: d2, activity_id: sk1.id, user_id: u2.id)
Schedule.create(date: d3, activity_id: sn1.id, user_id: u.id)
Schedule.create(date: d4, activity_id: sn1.id, user_id: u.id)

# Schedule.create(date: d1, activity_id: sn1.id, user_id: u3.id)
# Schedule.create(date: d2, activity_id: sk1.id, user_id: u3.id)
# Schedule.create(date: d3, activity_id: sn1.id, user_id: u3.id)
# Schedule.create(date: d4, activity_id: sn1.id, user_id: u3.id)

# d1 = Time.new(2021, 8, 27, 9, 00, 00).strftime '%Y/%m/%d %H:%M:%S'
# d2 = Time.new(2021, 8, 27, 11, 00, 00).strftime '%Y/%m/%d %H:%M:%S'
# d3 = Time.new(2021, 8, 27, 13, 30, 00).strftime '%Y/%m/%d %H:%M:%S'
# d4 = Time.new(2021, 8, 27, 15, 30, 00).strftime '%Y/%m/%d %H:%M:%S'
