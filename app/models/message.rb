class Message < ActiveRecord::Base
  belongs_to :talker, :polymorphic => true
  belongs_to :conversation
  validates_presence_of :talker_id
  validates_presence_of :talker_type
  validates_presence_of :message
end
