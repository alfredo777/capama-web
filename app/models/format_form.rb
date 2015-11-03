class FormatForm < ActiveRecord::Base
  has_many :roles, through: :format_form_to_roles
  has_many :questions

  accepts_nested_attributes_for  :questions, reject_if: :all_blank, allow_destroy: true
end
