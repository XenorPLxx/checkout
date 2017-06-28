class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.belongs_to :product, foreign_key: true
      t.integer :count
      t.date :date_from
      t.date :date_to

      t.timestamps
    end
  end
end
