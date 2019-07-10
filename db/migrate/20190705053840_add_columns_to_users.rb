class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :profile, :text
    add_column :users, :image_url, :string, default: ""
  end
end
