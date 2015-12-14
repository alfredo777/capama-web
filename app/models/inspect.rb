class Inspect < ActiveRecord::Base
  belongs_to :user_inspect

  auto_strip_attributes :name, :address, :inconforme, :acount, :meter, :t_ser, :additional_data

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
