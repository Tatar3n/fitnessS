class Competition < ApplicationRecord
  belongs_to :event
  has_many :competitions_users
  has_many :users, through: :competitions_users
end
