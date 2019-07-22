class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :gym_name, null: false, default: ""
      t.text   :details
      t.float  :grade
      t.float  :breadth
      t.float  :wall_height
      t.float  :congestion

      t.timestamps
    end

    add_index :gyms, :gym_name, unique: true
  end
end
