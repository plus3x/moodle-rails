class LearningUnit < ActiveRecord::Base
  belongs_to :course, touch: true

  validates :title, presence: true
end
