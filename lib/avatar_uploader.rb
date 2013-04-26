class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  
  #process :resize_to_fit => [80, 80]
  process :convert => 'png' 
  
  def filename
      "logo.#{model.cover.file.extension}" if original_filename

    #super.chomp(File.extname(super)) + '.png'
  end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    #"uploads/#{model.id}"
  end

  def default_url
   "/images/default_logo.jpg"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
