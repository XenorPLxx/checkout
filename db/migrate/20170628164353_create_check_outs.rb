class CreateCheckOuts < ActiveRecord::Migration[5.1]
  def change
    create_table :check_outs do |t|
      t.date :date_started
      t.date :date_closed

      t.timestamps
    end
  end
end
