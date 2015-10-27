class Customer < ActiveRecord::Base
  has_many :messages, as: :talker
  has_many :conversations
end
