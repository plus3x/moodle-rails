class Activity < ActiveRecord::Base
  include Bootsy::Container

  belongs_to :learning_unit, touch: true

  validates :title, presence: true
end
