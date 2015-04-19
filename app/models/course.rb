class Course < ActiveRecord::Base
  has_and_belongs_to_many :students, -> { where role: 'student' }, class_name: 'User'
  has_and_belongs_to_many :teachers, -> { where role: 'teacher' }, class_name: 'User'
  has_and_belongs_to_many :managers, -> { where role: 'manager' }, class_name: 'User'
  has_many :learning_units, dependent: :delete_all
  has_many :discussions

  validates :title, presence: true
end
