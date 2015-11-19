class ReadingAssignment < ActiveRecord::Base
 belongs_to :user
 has_many :reading_takes_waters

 after_create do 
  self.route_number = SecureRandom.hex(10)
  self.save 
 end
end
