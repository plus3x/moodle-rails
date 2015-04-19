class Submission < ActiveRecord::Base
  has_many :files, class_name: 'UploadFile'
  belongs_to :author, class_name: 'User'
  belongs_to :activity

  validates :comment, presence: true
  validate :grade_validation

  private

  def grade_validation
    return if grade == 0 || grade <= activity.max_grade
    errors.add :grade, 'Grade must be lesser then activity max grade'
  end
end
