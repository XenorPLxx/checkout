class CheckOutTotal < ActiveRecord::Migration[5.1]
  def change
    change_table "check_outs" do |t|
      t.decimal "final_total", :precision => 15, :scale => 2
    end
  end
end
