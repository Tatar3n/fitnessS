class CreateCompetitions < ActiveRecord::Migration[8.0]
  def change
    create_table :competitions do |t|
      t.string :name, null: false
      t.float :min_athlete_weight
      t.float :max_athlete_weight
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      # t.references :event, null: false, foreign_key: true


      t.timestamps
    end
  end
end
