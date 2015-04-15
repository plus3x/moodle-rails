class Course < ActiveRecord::Base
  has_many :learning_units, dependent: :delete_all

  validates :title, presence: true
end
