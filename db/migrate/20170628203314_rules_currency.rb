class RulesCurrency < ActiveRecord::Migration[5.1]
  def change
    change_table 'rules' do |t|
      t.belongs_to :currency, foreign_key: true
    end
  end
end
