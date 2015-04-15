FactoryGirl.define do
  sequence(:login, aliases: [:username]) { |n| "John##{n}" }
  sequence(:email) { |n| "john#{n}@mail.com" }

  factory :user do
    login
    email
    password 'secret'
    password_confirmation { password }

    factory(:admin) { role 'admin' }
    factory(:manager) { role 'manager' }
    factory(:teacher) { role 'teacher' }
    factory(:student) { role 'student' }
  end

  factory :course do
    title { |n| "Course##{n}" }
  end
end
