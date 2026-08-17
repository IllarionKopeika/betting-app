class CreateCompetitions < ActiveRecord::Migration[8.0]
  def change
    create_table :competitions do |t|
      t.string :name
      t.datetime :prediction_deadline

      t.timestamps
    end
  end
end
