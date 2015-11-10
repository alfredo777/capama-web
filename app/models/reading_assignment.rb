class ReadingAssignment < ActiveRecord::Base
 belongs_to :user
 has_many :reading_takes_waters
end
