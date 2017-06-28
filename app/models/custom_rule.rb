class CustomRule < ApplicationRecord
  validates_presence_of :rule, :product_id, :date_from, :date_to
  belongs_to :product
end
