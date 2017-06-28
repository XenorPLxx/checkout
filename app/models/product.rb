class Product < ApplicationRecord
  validates_uniqueness_of :description
  validates_presence_of :currency_id, :price, :description
  belongs_to :currency
end
