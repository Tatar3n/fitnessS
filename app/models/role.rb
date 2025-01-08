class Role < ApplicationRecord
  belongs_to :user
  enum :role_name, { user: 0, athlete: 1, referee: 2 }
end
