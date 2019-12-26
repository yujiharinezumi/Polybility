class AddSomeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :age, :integer, default: 0
      add_column :users, :gender, :integer,default: 0
      add_column :users, :country, :string, default: ""
      add_column :users, :native_language, :string, default: ""
      add_column :users, :learning_language, :string, default: ""
      add_column :users, :hobby, :string, default: ""


  end
end
