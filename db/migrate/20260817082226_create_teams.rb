class CreateTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :teams do |t|
      t.string :en_name
      t.string :ru_name
      t.string :logo

      t.timestamps
    end
  end
end
