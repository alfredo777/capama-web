class ChangeMeteterAnomalyToInspects < ActiveRecord::Migration
  def change
     change_column :inspects, :meter_anomaly,  :text
  end
end
