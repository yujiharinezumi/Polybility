class AddColumnToLanguage < ActiveRecord::Migration[5.2]
  def change
    add_column :languages, :flag, :string, null: false, default: ""
  end
end
