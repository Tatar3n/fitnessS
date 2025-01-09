class Event < ApplicationRecord
  has_many :competitions
  accepts_nested_attributes_for :competitions, allow_destroy: true

  validates :title, presence: true
  validates :place, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true, comparison: { greater_than: :starts_at }

  def self.upcoming_events
    Event.where("starts_at > ?", DateTime.now).order("starts_at")
  end
  def self.current_events
    Event.where("starts_at <= ? and ends_at >= ?", DateTime.now, DateTime.now).order("starts_at")
  end
  def self.past_events
    Event.where("ends_at < ?", DateTime.now).order("ends_at DESC")
  end
end
