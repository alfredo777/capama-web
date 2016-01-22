class UserInspect < ActiveRecord::Base
  has_many :inspects
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :date_inspect
  
end
