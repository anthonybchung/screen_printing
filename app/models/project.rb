class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :customer_name, presence: true
end
