class RulePrice < ActiveRecord::Migration[5.1]
  def change
    change_table "Rules" do |t|
      t.decimal "price", :precision => 15, :scale => 2
    end
  end
end
