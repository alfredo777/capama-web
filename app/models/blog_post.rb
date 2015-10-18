class BlogPost < ActiveRecord::Base
  belongs_to :user

  mount_uploader :head_image, HeadImageUploader
end
