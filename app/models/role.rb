class Role < ActiveRecord::Base
  has_many :permissions
  has_many :users
  has_many :format_forms, through: :format_form_to_roles

  before_destroy do 
    self.users.each do |u|
      u.role_id = nil
      u.save
    end
    self.permissions.each do |p|
      p.destroy
    end
  end
end
