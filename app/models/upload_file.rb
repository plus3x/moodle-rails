class UploadFile < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :activity
  belongs_to :submission

  mount_uploader :file, FileUploader

  scope :not_submitted, -> { where submission_id: nil }

  validates :file, :author_id, presence: true

  def file_name
    file.file.filename
  end

  def file_name_with_created_at
    "#{file_name} (#{I18n.l created_at})"
  end

  def file_name_with_created_at_and_submitting_status
    result = file_name_with_created_at
    result << " - submitted" if submission_id
    result
  end
end
