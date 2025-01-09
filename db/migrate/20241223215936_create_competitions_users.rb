class CreateCompetitionsUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :competitions_users do |t|
      t.references :competition, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :role, null: false

      t.timestamps
    end
  end
end
