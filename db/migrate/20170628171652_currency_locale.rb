class CurrencyLocale < ActiveRecord::Migration[5.1]
  def change
    change_table "currencies" do |t|
      t.string "locale"
    end
  end
end
