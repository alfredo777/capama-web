class UserHelp < ActiveRecord::Base
  belongs_to :user
  has_many :conversations
  has_many :public_images, as: :imageable
  validates_presence_of :email
  validates_presence_of :cause
  validates_presence_of :explanation
  validates_presence_of :user_id

  def customer
    @customer = Customer.find_by_email("#{self.email}")
  end
end
