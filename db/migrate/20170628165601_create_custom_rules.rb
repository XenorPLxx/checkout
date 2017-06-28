class CreateCustomRules < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_rules do |t|
      t.belongs_to :product, foreign_key: true
      t.text :rule
      t.date :date_from
      t.date :date_to

      t.timestamps
    end
  end
end
