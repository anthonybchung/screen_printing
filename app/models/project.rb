class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :customer_name, presence: true

  scope :search_by_name_or_customer, ->(query) {
    if query.present?
      where("name ILIKE :query or customer_name ILIKE :query", query: "%#{query}%")
    else
      all
    end
  }
end
