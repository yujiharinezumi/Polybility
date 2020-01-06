class ChangeDataGenderToUser < ActiveRecord::Migration[5.2]
  def up
     change_column :users, :gender, :string
  end
end
