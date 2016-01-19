class ChangeTableInspectsMeterAnomaly < ActiveRecord::Migration
  def change
      change_column :inspects, :meter_anomaly,  :string
  end
end
