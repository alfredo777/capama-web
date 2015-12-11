# encoding: utf-8

class CelphoneImagesUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

   def filename
    "#{SecureRandom.hex(20)}"+".png" if original_filename
   end

end
