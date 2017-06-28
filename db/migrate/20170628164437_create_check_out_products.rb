class CreateCheckOutProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :check_out_products do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :check_out, foreign_key: true
      t.date :date_added
      t.date :date_hidden

      t.timestamps
    end
  end
end
