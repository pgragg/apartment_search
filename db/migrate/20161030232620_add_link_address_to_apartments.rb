class AddLinkAddressToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :link_address, :string
  end
end
