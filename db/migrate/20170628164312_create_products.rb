class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.belongs_to :currency, foreign_key: true
      t.decimal :price, :precision => 15, :scale => 2
      t.string :description

      t.timestamps
    end
  end
end
