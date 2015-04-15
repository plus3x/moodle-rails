class LearningUnit < ActiveRecord::Base
  belongs_to :course, touch: true
  has_many :activities, dependent: :delete_all

  validates :title, presence: true
end
