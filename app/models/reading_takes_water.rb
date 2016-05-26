class ReadingTakesWater < ActiveRecord::Base
  belongs_to :reading_assignment

  auto_strip_attributes :business_name, :address, :colony, :water_meter, :diameter, :reference, :observations, :sx, :ux, :stage, :account_number, :abnormalities, :lecture, :data_access, :reading_assignment_id, :successfully_completed, :created_at, :updated_at

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

  def count_images
    #lol
    @images = ImagesStringCelphone.where(imageable_id: self.id, imageable_type: "routes").count
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
