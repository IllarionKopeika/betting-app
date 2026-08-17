class CreateCompetitionTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :competition_teams do |t|
      t.references :team, null: false, foreign_key: true
      t.references :competition, null: false, foreign_key: true

      t.timestamps
    end
    add_index :competition_teams, [ :team_id, :competition_id ], unique: true
  end
end
