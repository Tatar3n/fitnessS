class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :place, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false

      t.timestamps
    end
  end
end
