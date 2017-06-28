class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :abbr
      t.string :description
      t.boolean :is_base

      t.timestamps
    end
  end
end
