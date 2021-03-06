class Activity < ActiveRecord::Base
  include Bootsy::Container

  belongs_to :learning_unit, touch: true
  has_many :uploaded_files, class_name: 'UploadFile'
  has_many :submissions

  validates :title, presence: true

  def graded_students
    submissions.where('grade > 0').count
  end
end
