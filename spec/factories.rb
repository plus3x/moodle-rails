FactoryGirl.define do
  sequence(:login, aliases: %i(username)) { |n| "John##{n}" }
  sequence(:email) { |n| "john#{n}@mail.com" }
  sequence(:description, aliases: %i(comment question)) { ('A'..'z').to_a.*(10).sample(255).join }

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

  factory :learning_unit do
    title { |n| "LearningUnit##{n}" }
    course
  end

  factory :activity do
    title { |n| "Activity##{n}" }
    description
    learning_unit
  end

  factory :upload_file do
    file { open 'spec/fixtures/calculations.txt' }
    activity
    association :author, factory: :user
  end

  factory :submission do
    comment
    activity
    association :author, factory: :user
  end

  factory :discussion do
    title { |n| "Discussion##{n}" }
    question
    course
    association :author, factory: :user
  end
end
