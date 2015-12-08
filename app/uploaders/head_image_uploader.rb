# encoding: utf-8

class HeadImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :image_head do
     process :resize_to_fill => [770, 400]
  end

  version :ban do
     process :resize_to_fill => [440, 280]
  end

  version :super_large do
     process :resize_to_fill => [3000,2064]
  end


  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


end
