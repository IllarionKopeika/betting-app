class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :competition

  enum :prediction_type, { winner: 0, top: 1, relegation: 2 }
end
