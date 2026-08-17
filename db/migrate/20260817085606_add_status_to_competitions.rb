class AddStatusToCompetitions < ActiveRecord::Migration[8.0]
  def change
    add_column :competitions, :status, :integer
  end
end
