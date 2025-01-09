class Competition < ApplicationRecord
  belongs_to :event
  has_many :competitions_users
  has_many :users, through: :competitions_users

  validates :event_id, presence: true
  validates :name, presence: true
  validates :min_athlete_weight, presence: true, comparison: { greater_than: 0 }
  validates :max_athlete_weight, presence: true, comparison: { greater_than: :min_athlete_weight }
end