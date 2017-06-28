class CheckOutProduct < ApplicationRecord
  validates_presence_of :product_id, :check_out_id
  belongs_to :product
  belongs_to :check_out
end
