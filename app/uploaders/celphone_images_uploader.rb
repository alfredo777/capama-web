# encoding: utf-8

class CelphoneImagesUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process convert: 'png'

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/"
  end

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename.present?
  end

end
