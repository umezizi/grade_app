class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title,        null: false, default: ""
      t.text :content
      t.integer :grade,       null: false, default: 0
      t.integer :breadth,     null: false, default: 0
      t.integer :wall_height, null: false, default: 0
      t.integer :congestion,  null: false, default: 0
      t.references :gym,  foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:gym_id,  :created_at]
    add_index :reviews, [:user_id, :created_at]
  end
end
