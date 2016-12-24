class AddTimesToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :time_from_megans, :integer
    add_index :apartments, :time_from_megans
    add_column :apartments, :time_from_pipers, :integer
    add_index :apartments, :time_from_pipers
  end
end
