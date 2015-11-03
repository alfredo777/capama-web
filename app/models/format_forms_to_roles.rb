class FormatFormsToRoles < ActiveRecord::Base
  belongs_to :format_forms
  belongs_to :roles
end
