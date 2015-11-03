class Question < ActiveRecord::Base
  belongs_to :format_form
  has_many :question_options
  has_many :question_responses
  accepts_nested_attributes_for  :question_options, reject_if: :all_blank, allow_destroy: true
end
