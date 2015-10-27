class BlogPost < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :head_image

  mount_uploader :head_image, HeadImageUploader
end
