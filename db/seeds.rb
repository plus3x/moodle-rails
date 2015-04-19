# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
users = [
  {
    role: 'student',
    login: 'student',
    first_name: 'Max',
    last_name: 'Student',
    email: 'student@mail.com',
    password: 'student'
  },
  {
    role: 'teacher',
    login: 'teacher',
    first_name: 'Max',
    last_name: 'Teacher',
    email: 'teacher@mail.com',
    password: 'teacher'
  },
  {
    role: 'manager',
    login: 'manager',
    first_name: 'Max',
    last_name: 'Manager',
    email: 'manager@mail.com',
    password: 'manager'
  },
  {
    role: 'admin',
    login: 'admin',
    first_name: 'Max',
    last_name: 'Admin',
    email: 'admin@mail.com',
    password: 'admin'
  }
]
puts 'Default users:'
User.create!(users).each do |user|
  puts "  #{user.id} - #{user.login}"
end

Course.delete_all
courses = [
  { title: 'Course with week delimeter' },
  { title: 'Blank Course' }
]
puts 'Default courses:'
Course.create!(courses).each do |course|
  puts "  #{course.id} - #{course.title}"
end

LearningUnit.delete_all
learning_units = [
  { title: 'Week 1', course: Course.first },
  { title: 'Week 2', course: Course.first },
  { title: 'Week 3', course: Course.first }
]
puts 'Default learning units:'
LearningUnit.create!(learning_units).each do |learning_unit|
  puts "  #{learning_unit.id} - #{learning_unit.title} on course \"#{learning_unit.course.title}\""
end

Activity.delete_all
standard_description = '<p><strong>Description</strong> of activity</p>'
activities = [
  { title: 'First assgnment', description: standard_description, learning_unit: LearningUnit.first, max_grade: 40 },
  { title: 'Need Submissions', description: standard_description, learning_unit: LearningUnit.first },
  { title: 'Readme', description: standard_description, learning_unit: LearningUnit.first },
  { title: 'File upload', description: standard_description, learning_unit: LearningUnit.second },
  { title: 'Team assignment to read', description: standard_description, learning_unit: LearningUnit.second },
  { title: 'Participant', description: standard_description, learning_unit: LearningUnit.second },
  { title: 'With Discussion', description: standard_description, learning_unit: LearningUnit.third },
  { title: 'QUIZ Assignment', description: standard_description, learning_unit: LearningUnit.third },
  { title: 'Some task', description: standard_description, learning_unit: LearningUnit.third }
]
puts 'Default activities:'
Activity.create!(activities).each do |activity|
  puts "  #{activity.id} - #{activity.title} on learning unit \"#{activity.learning_unit.title}\""
end

Discussion.delete_all
discussions = [
  { title: 'Many questions', question: '<ul><li>First?</li><li>Second?</li></ul>', author_id: User.teacher.first.id, course: Course.first }
]
puts 'Default discussions:'
Discussion.create!(discussions).each do |discussion|
  puts "  #{discussion.id} - #{discussion.title} on course \"#{discussion.course.title}\""
end

User.all.each { |u| u.courses << Course.all }
