class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :category
      t.string :day
      t.string :name
      t.text :description
      t.string :set
      t.string :rep
      t.string :duration
      t.string :rest
      t.text :note
      t.integer :user_id
      t.timestamps
    end
   add_index :workouts, [:user_id, :created_at]
  end
end
