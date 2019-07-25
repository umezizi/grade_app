class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :guest_user_id
      t.integer :favorite_gym_id

      t.timestamps
    end
    add_index :relationships, :guest_user_id
    add_index :relationships, :favorite_gym_id
    add_index :relationships, [:guest_user_id, :favorite_gym_id], unique: true
  end
end
