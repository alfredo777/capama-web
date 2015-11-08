class BlogPost < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :head_image

  mount_uploader :head_image, HeadImageUploader

  def blog_acces_open
   @vistas = Views.where(viewver_type: "BlogPost", viewver_id: self.id).count
  end
end
