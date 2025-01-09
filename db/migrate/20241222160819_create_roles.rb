class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :role_name, default: 0

      t.timestamps
    end
  end
end
