class Team < ApplicationRecord
  has_many :competition_teams
  has_many :competitions, through: :competition_teams
  has_many :predictions
end
