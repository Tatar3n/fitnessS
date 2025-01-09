class CompetitionsUser < ApplicationRecord
  belongs_to :competition
  belongs_to :user

  validates :role, presence: true
end
