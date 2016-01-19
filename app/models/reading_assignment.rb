class ReadingAssignment < ActiveRecord::Base
 belongs_to :user
 has_many :reading_takes_waters

 validates_presence_of :user_id
 validates_presence_of :future_scheduled
 validates_presence_of :route_number

 after_create do 
  self.route_number = SecureRandom.hex(10)
  self.save 
 end
end
