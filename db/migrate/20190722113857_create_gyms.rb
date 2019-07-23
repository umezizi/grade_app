class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :gym_name, null: false, default: ""
      t.text   :details

      t.timestamps
    end

    add_index :gyms, :gym_name, unique: true
  end
end
