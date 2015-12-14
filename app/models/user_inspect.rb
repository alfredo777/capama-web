class UserInspect < ActiveRecord::Base
  has_many :inspects
  belongs_to :user
  
end
