class Competition < ApplicationRecord
  scope :ongoing, -> { where(status: :ongoing) }
  scope :locked, -> { where(status: :locked) }
  scope :completed, -> { where(status: :completed) }

  has_many :competition_teams, dependent: :destroy
  has_many :teams, through: :competition_teams
  has_many :predictions, dependent: :destroy

  enum :status, { ongoing: 0, locked: 1, completed: 2 }

  before_save :set_ongoing_status

  private

  def set_ongoing_status
    self.status = :ongoing
  end
end
