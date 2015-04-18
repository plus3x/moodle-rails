class FileUploader < CarrierWave::Uploader::Base
  def store_dir
    super + "/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(txt doc docx xsl jpg jpeg gif png)
  end
end
