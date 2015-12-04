class CreateServiceContracts < ActiveRecord::Migration
  def change
    create_table :service_contracts do |t|
      t.string :drinking_water
      t.string :sewage_system
      t.string :acount
      t.string :meter
      t.string :diameter
      t.string :applicant_name
      t.string :address
      t.string :colony
      t.string :phone
      t.string :bussiness_name
      t.string :rfc
      t.string :commercial_bussines
      t.string :legal_representative
      t.string :type_service
      t.string :legal_title
      
      t.timestamps
    end
  end
end
