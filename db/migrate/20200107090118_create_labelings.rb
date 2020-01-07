class CreateLabelings < ActiveRecord::Migration[5.2]
  def change
    create_table :labelings do |t|
      t.integer :user_id
      t.integer :label_id
      t.references :user, foreign_key: true
      t.references :label, foreign_key: true

      t.timestamps
    end
  end
end
