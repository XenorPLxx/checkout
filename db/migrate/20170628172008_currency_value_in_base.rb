class CurrencyValueInBase < ActiveRecord::Migration[5.1]
  def change
    change_table "currencies" do |t|
      t.decimal "value_in_base", :precision => 15, :scale => 2
    end
  end
end
