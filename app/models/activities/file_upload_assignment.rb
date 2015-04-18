class FileUploadAssignment < Activity
  has_many :upload_files
  has_many :submissions
end
