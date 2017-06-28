class CheckOutProduct < ApplicationRecord
  belongs_to :product
  belongs_to :check_out
end
