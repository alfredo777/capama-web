# encoding: utf-8

class ImagesUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  version :xsmaill do
    process :resize_to_fill => [50, 50]
  end
  
  version :mini do
     process :resize_to_fill => [228, 220]
  end

  version :mid do 
     process :resize_to_fill => [550, 335]
  end

  version :full do 
     process :resize_to_fill => [1200, 820]
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
