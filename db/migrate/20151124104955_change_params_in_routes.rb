class ChangeParamsInRoutes < ActiveRecord::Migration
  def change
    remove_column :reading_takes_waters, :lecture
    remove_column :reading_takes_waters, :abnormalities
    remove_column :reading_takes_waters, :observations
    remove_column :reading_takes_waters, :reference
    add_column :reading_takes_waters, :lecture, :text
    add_column :reading_takes_waters, :abnormalities, :text
    add_column :reading_takes_waters, :observations, :text
    add_column :reading_takes_waters, :reference, :text
  end
end
