class RenameOldColumnNameInResults < ActiveRecord::Migration[8.0]
  def change
    rename_column :results, :scope, :score
  end
end
