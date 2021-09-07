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

sn1_img = 'https://res.cloudinary.com/sdcnwco/image/upload/v1630034989/SS-API-images/snb1_humsnn.png'
sn2_img = 'https://res.cloudinary.com/sdcnwco/image/upload/v1630034989/SS-API-images/snb2_i3dslm.png'
sn3_img = 'https://res.cloudinary.com/sdcnwco/image/upload/v1630034989/SS-API-images/snb32_s3iaaa.png'
sk1_img = 'https://res.cloudinary.com/sdcnwco/image/upload/v1630035071/SS-API-images/ski1_iolbx1.png'
sk2_img = 'https://res.cloudinary.com/sdcnwco/image/upload/v1630167110/SS-API-images/sk2_vfb3cm.png'
sk3_img = 'https://res.cloudinary.com/sdcnwco/image/upload/v1630167105/SS-API-images/sk3_gcdnak.png'

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
