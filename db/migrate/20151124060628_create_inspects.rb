class CreateInspects < ActiveRecord::Migration
  def change
    create_table :inspects do |t|
      t.string :name 
      t.string :address 
      t.string :inconforme 
      t.string :acount 
      t.string :meter 
      t.string :t_ser 
      t.string :additional_data 
      t.string :date 
      t.string :visit_date 
      t.string :general_inspect 
      t.string :shooting_conditions 
      t.string :home_room 
      t.string :number_of_people 
      t.string :ordeno_prueba_de_inspeccion 
      t.string :property_activity 
      t.string :anomalies 
      t.string :meter_conditions 
      t.string :additional_report
      
      t.timestamps
    end
  end
end
