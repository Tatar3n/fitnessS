class Competition < ApplicationRecord
  belongs_to :event, inverse_of: :competitions
  has_many :competitions_users
  has_many :users, through: :competitions_users
  has_many :results, dependent: :destroy

  validates :event, presence: true
  validates :name, presence: true
  validates :min_athlete_weight, presence: true, comparison: { greater_than: 0 }
  validates :max_athlete_weight, presence: true, comparison: { greater_than: :min_athlete_weight }
end
