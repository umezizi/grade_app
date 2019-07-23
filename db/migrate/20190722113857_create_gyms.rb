class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :gym_name, null: false, default: ""
      t.text   :details
      t.float  :grade,                 default: 0
      t.float  :breadth,               default: 0
      t.float  :wall_height,           default: 0
      t.float  :congestion,            default: 0

      t.timestamps
    end

    add_index :gyms, :gym_name, unique: true
  end
end
