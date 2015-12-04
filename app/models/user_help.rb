class UserHelp < ActiveRecord::Base
  belongs_to :user
  has_many :conversations
  has_many :public_images, as: :imageable
  validates_presence_of :phone
  validates_presence_of :cause
  validates_presence_of :explanation

  def customer
    @customer = Customer.find_by_email("#{self.email}")
  end
end
