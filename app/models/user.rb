class User < ActiveRecord::Base
  include Abilitable

  has_and_belongs_to_many :courses

  has_secure_password

  enum role: {
    admin: 'admin',
    manager: 'manager',
    teacher: 'teacher',
    student: 'student',
    guest: 'guest'
  }

  validates :login, :email, :role, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

  def avatar_url
    'avatar.jpg'
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
