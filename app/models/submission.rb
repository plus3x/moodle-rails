class Submission < ActiveRecord::Base
  has_many :files, class_name: 'UploadFile'
  belongs_to :author, class_name: 'User'
  belongs_to :activity
end
