class Comment < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :parent, class_name: 'Comment'
  belongs_to :author, class_name: 'User'
  has_many :childs, class_name: 'Comment', foreign_key: :parent_id

  scope :parents_off, -> { where parent_id: nil }

  validates :text, presence: true
end
