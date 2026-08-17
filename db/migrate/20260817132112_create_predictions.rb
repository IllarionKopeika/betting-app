class CreatePredictions < ActiveRecord::Migration[8.0]
  def change
    create_table :predictions do |t|
      t.integer :prediction_type
      t.integer :predicted_position
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :competition, null: false, foreign_key: true

      t.timestamps
    end
    add_index :predictions, [ :user_id, :team_id, :competition_id ], unique: true
  end
end
