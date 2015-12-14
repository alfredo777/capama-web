class User < ActiveRecord::Base
  belongs_to :role
  has_many :blog_posts
  mount_uploader :avatar, AvatarUploader
  has_many :pictures
  has_many :user_helps
  has_many :messages, as: :talker
  has_many :conversations
  has_many :reading_assignments
  has_many :user_inspects
  validates_presence_of :password
  validates_presence_of :name
  validates_presence_of :card

  auto_strip_attributes :name, :card, :password, :email, :phone, :area, :responsible_for_accidents, :social_security, :immediate_boss, :immediate_boss_email

  

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

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    puts spreadsheet
    header = spreadsheet.row(1)
    puts header
    (2..spreadsheet.last_row).each do |single_row|
      row = Hash[[header, spreadsheet.row(single_row)].transpose]
      user = find_by_id(row["id"]) || new
      user.attributes = row.to_hash.slice(*row.to_hash.keys)
      user.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::CSV.new(file.path, :headers=>true, :encoding => 'windows-1251:utf-8')
    when '.xls' then Roo::Excel.new(file.path, :headers=>true, :encoding => 'windows-1251:utf-8')
    when '.xlsx' then Roo::Excelx.new(file.path, :headers=>true, :encoding => 'windows-1251:utf-8')
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
