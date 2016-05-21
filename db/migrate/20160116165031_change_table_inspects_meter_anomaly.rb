class ChangeTableInspectsMeterAnomaly < ActiveRecord::Migration
  def change
      change_column :inspects, :meter_anomaly, :text, :limit => 4294967295
  end
end
