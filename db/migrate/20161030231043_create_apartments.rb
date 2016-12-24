class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|
      t.string :address
      t.integer :price
      t.integer :beds
      t.integer :baths
      t.integer :square_footage
      t.boolean :fee

      t.timestamps
    end
    add_index :apartments, :address
    add_index :apartments, :price
    add_index :apartments, :beds
    add_index :apartments, :baths
    add_index :apartments, :square_footage
  end
end
