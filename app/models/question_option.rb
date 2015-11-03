class QuestionOption < ActiveRecord::Base
  belongs_to :question
  has_many :question_response
end
