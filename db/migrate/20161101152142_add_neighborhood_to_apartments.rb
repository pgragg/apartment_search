class AddNeighborhoodToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :neighborhood, :string
    add_index :apartments, :neighborhood
  end
end
