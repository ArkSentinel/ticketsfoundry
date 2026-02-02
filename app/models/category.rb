class Category < ApplicationRecord
  # Esta línea es la que falta
  has_many :tickets, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end