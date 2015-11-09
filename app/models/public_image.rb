class PublicImage < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  validates_presence_of :imageable_id
  validates_presence_of :imageable_type
  validates_presence_of :img

  mount_uploader :img, ImagesUploader 
end
