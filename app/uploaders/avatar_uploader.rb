# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  version :gigant do
     process :resize_to_fill => [128, 128]
  end

  version :mini do 
     process :resize_to_fill => [50, 50]
  end

  version :thumb do 
     process :resize_to_fill => [42, 40]
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
