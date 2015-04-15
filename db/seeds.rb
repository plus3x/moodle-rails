# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
users = [
  { role: 'student', login: 'student', email: 'student@mail.com', password: 'student' },
  { role: 'teacher', login: 'teacher', email: 'teacher@mail.com', password: 'teacher' },
  { role: 'manager', login: 'manager', email: 'manager@mail.com', password: 'manager' },
  { role: 'admin', login: 'admin', email: 'admin@mail.com', password: 'admin' }
]
puts 'Default users:'
User.create!(users).each do |user|
  puts "  #{user.id} - #{user.login}"
end

Course.delete_all
courses = [
  { title: 'New course' }
]
puts 'Default courses:'
Course.create!(courses).each do |course|
  puts "  #{course.id} - #{course.title}"
end

LearningUnit.delete_all
learning_units = [
  { title: 'New learning unit', course: Course.first }
]
puts 'Default learning units:'
LearningUnit.create!(learning_units).each do |learning_unit|
  puts "  #{learning_unit.id} - #{learning_unit.title} on course \"#{learning_unit.course.title}\""
end

Activity.delete_all
activities = [
  { title: 'New activity', learning_unit: LearningUnit.first }
]
puts 'Default activities:'
Activity.create!(activities).each do |activity|
  puts "  #{activity.id} - #{activity.title} on learning unit \"#{activity.learning_unit.title}\""
end
