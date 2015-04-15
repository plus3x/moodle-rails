class Activity < ActiveRecord::Base
  belongs_to :learning_unit, touch: true

  validates :title, presence: true
end
