class CelphoneImages < ActiveRecord::Base
  validates_presence_of :imageable_id
  validates_presence_of :imageable_type
  validates_presence_of :img

  mount_uploader :img, CelphoneImagesUploader



end
