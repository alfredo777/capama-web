class User < ActiveRecord::Base
  belongs_to :role
  has_many :blog_posts
  mount_uploader :avatar, AvatarUploader
  has_many :pictures
  has_many :user_helps
  has_many :messages, as: :talker
  has_many :conversations
  validates_presence_of :password
  validates_presence_of :name
  validates_presence_of :card
  

  after_create do
    randomrhash = SecureRandom.hex(32)
    passwordcript = Digest::SHA2.hexdigest(self.password)
    puts self.password
    self.rhash = "#{randomrhash}"
    self.password = "#{passwordcript}"
    self.save
  end

  def encripted_password
    Digest::SHA2.hexdigest( self.rhash.to_s + self.password.to_s  ) 
  end

  def w_digest(passresive)
    cript = Digest::SHA2.hexdigest( self.rhash.to_s + passresive.to_s )
    compare_acces(cript, encripted_password )
  end

  def secure_key
    "#{SecureRandom.hex(9090)}"
  end

  def compare_acces(cript, decript)
    if cript ==  decript
      true
      else
      false
    end
  end 

end
