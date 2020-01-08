class RenameNameColumnToLabel < ActiveRecord::Migration[5.2]
  def change
      rename_column :labels, :name, :hobby
  end
end
