class CustomRule < ApplicationRecord
  validates_presence_of :rule, :product_id, :date_from, :date_to
  belongs_to :product
  validate :crossrule
  validate :dates_continuity

  def crossrule
    if self.coliding.count > 0
      self.errors.add(:base, "Another custom rule is set for that product, count and time range")
    end
  end


    def dates_continuity
      if self.date_to < self.date_from
        self.errors.add(:base, "Date from can't take place after date to")
      end
    end

    def coliding
      coliding_rules = Rule.where(product_id: self.product_id).
           where("date_from BETWEEN ? AND ? OR date_to BETWEEN ? AND ?",
                  self.date_from, self.date_to, self.date_from, self.date_to)
      coliding_rules = coliding_rules.where("id <> ?", self.id) if self.id
      coliding_rules
    end
end
