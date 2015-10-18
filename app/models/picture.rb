class Picture < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :version_img
  mount_uploader :version_img, ImagesUploader
end
