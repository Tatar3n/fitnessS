class Result < ApplicationRecord
  belongs_to :athlete, class_name: "User", foreign_key: "athlete_id"
  belongs_to :referee, class_name: "User", foreign_key: "referee_id"
  belongs_to :competition
end
