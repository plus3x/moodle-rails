FactoryGirl.define do
  sequence(:login, aliases: [:username]) { |n| "John##{n}" }
  sequence(:email) { |n| "john#{n}@mail.com" }
  sequence(:description) { ('A'..'z').to_a.*(10).sample(255).join }

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
    file { |n| "path/to/file.#{n}" }
    association :author, factory: :user
  end

  factory :submission
end
