class AddEventToCompetitions < ActiveRecord::Migration[8.0]
  def change
    add_reference :competitions, :event, null: false, foreign_key: true
  end
end
