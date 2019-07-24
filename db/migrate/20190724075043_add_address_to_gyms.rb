class AddAddressToGyms < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :prefecture, :string, null: false, default: ""
    add_column :gyms, :address, :string
    add_column :gyms, :latitude, :float
    add_column :gyms, :longitude, :float
  end
end
