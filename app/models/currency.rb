class Currency < ApplicationRecord
  validates_presence_of :abbr, :description, :locale, :value_in_base
  validate :base

  def base
    if Currency.find_by(is_base: true) and self.is_base
      self.errors.add(:base, "There might be only one base currency!")
    end
  end

end
