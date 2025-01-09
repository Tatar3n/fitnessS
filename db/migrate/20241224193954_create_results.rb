class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.references :athlete, null: false, foreign_key: { to_table: :users }
      t.references :referee, null: false, foreign_key: { to_table: :users }
      t.references :competition, null: false, foreign_key: true
      t.float :scope

      t.timestamps
    end
  end
end
