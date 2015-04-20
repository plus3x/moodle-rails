class Discussion < ActiveRecord::Base
  include Bootsy::Container

  belongs_to :course
  belongs_to :author, class_name: 'User'
  has_many :comments

  validates :title, :question, presence: true
end
