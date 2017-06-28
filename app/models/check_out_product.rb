class CheckOutProduct < ApplicationRecord
  validates_presence_of :product_id, :check_out_id
  belongs_to :product
  belongs_to :check_out

  scope :grouped_by_product, -> { group(:product_id).select("COUNT(*) as product_count, date_added, product_id, sum(price) AS sum_price").joins(:product) }  
end
