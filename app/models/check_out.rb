class CheckOut < ApplicationRecord
  validates_presence_of :final_total, :if => Proc.new { |a| !a.date_closed.nil? }
  has_many :check_out_products

  def initialize
    super
    self.date_started = DateTime.now
    self.save!
  end

  def scan(product_name)
    if product = Product.find_by("description = ?", product_name)
      CheckOutProduct.create(product_id: product.id, check_out_id: self.id, date_added: DateTime.now)
    else
      self.errors.add(:base, "Product wasn't found.")
      puts "Product wasn't found."
    end
  end

  def close
    self.date_closed = DateTime.now
    self.final_total = total
  end

  def total
    total = 0
    self.check_out_products.each do |check_out_product|
      total += check_out_product.product.price
    end
    total
  end
end
