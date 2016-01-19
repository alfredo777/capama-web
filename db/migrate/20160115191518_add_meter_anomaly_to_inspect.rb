class AddMeterAnomalyToInspect < ActiveRecord::Migration
  def change
    add_column :inspects, :meter_anomaly, :string
    add_column :inspects, :last_lecture, :string
    add_column :inspects, :in_charge, :string
    add_column :inspects, :other_obs, :text
  end
end
