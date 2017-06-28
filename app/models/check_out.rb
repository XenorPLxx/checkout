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
    # iteruj po wszystkich pozycjach
    self.check_out_products.grouped_by_product.each do |check_out_product|
      # reguły ręczne mają priorytet
      custom_rule = CustomRule.where("product_id = ? AND date_from <= ? AND date_to >= ?",
                     check_out_product.product_id, self.date_started, self.date_started).first
      if custom_rule
        eval(custom_rule.rule)
      # jeżeli brak ręcznych liczymyu normalnie
      else
        rules = Rule.where("product_id = ? AND count <= ? AND date_from <= ? AND date_to >= ?",
                     check_out_product.product_id, check_out_product.product_count,
                     self.date_started, self.date_started).
                     order(count: :desc)
        count_used_on_rules = 0
        # zastosuj reguły ilościowe (największa możliwa ilość pierwsz)
        if rules.count > 0
          while (check_out_product.product_count - count_used_on_rules) >= rules.first.count
            if (check_out_product.product_count - count_used_on_rules) >= rules.last.count
              total += rules.last.price * rules.last.currency.value_in_base
              count_used_on_rules += rules.last.count
            else
              rules.pop
            end
          end
        end
        # dodaj produkty nie łapiące się na żadne reguły
        total += (check_out_product.product_count - count_used_on_rules) * check_out_product.product.price * check_out_product.product.currency.value_in_base
      end
    end
    total
  end
end
