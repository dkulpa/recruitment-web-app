# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_interests = Interest.create!([
  {name: 'healthy lifestyle', interest_type: 'health'},
  {name: 'coding', interest_type: 'work'}
])

test_interests = Interest.create!([
  {name: 'tennis', interest_type: 'sport'},
  {name: 'MMA', interest_type: 'sport'}
])

test1_interests = Interest.create!([
  {name: 'tennis', interest_type: 'sport'},
  {name: 'MMA', interest_type: 'sport'}
])

test2_interests = Interest.create!([
  {name: 'tennis', interest_type: 'sport'},
  {name: 'MMA', interest_type: 'sport'}
])

test3_interests = Interest.create!([
  {name: 'tennis', interest_type: 'sport'},
  {name: 'MMA', interest_type: 'sport'}
])

User.create!([
  {email: 'admin@example.com', gender: 'male', age: 24, interests: admin_interests, password: 'testpass', admin: true},
  {email: 'test@example.com', gender: 'female', age: 47, interests: test_interests, password: 'qweasd', admin: false},
  {email: 'test1@example.com', gender: 'female', age: 47, interests: test1_interests, password: 'qweasd', admin: false},
  {email: 'test2@example.com', gender: 'female', age: 47, interests: test2_interests, password: 'qweasd', admin: false},
  {email: 'test3@example.com', gender: 'female', age: 47, interests: test3_interests, password: 'qweasd', admin: false}
])
