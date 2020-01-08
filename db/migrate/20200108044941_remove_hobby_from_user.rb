class RemoveHobbyFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :hobby, :string
  end
end
