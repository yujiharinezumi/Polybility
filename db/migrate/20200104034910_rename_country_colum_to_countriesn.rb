class RenameCountryColumToCountriesn < ActiveRecord::Migration[5.2]
  def change
    rename_column :countries, :country,:name
  end
end
