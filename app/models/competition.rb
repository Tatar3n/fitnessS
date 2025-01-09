class Competition < ApplicationRecord
  has_one :event
  has_many :users
  has_many :competitions_users
  has_many :users, through: :competitions_users
end
