class Source < ApplicationRecord
  has_many :allocsources
  validates :id,       presence: true, length: { minimum: 1 }
  validates :field1,   presence: true, length: { minimum: 1 }
  validates :field2,   presence: true, length: { minimum: 1 }
  validates :field3,   presence: true, length: { minimum: 1 }
  validates :field4,   presence: true, length: { minimum: 1 }
  validates :field5,   presence: true, length: { minimum: 1 }
  validates :quantity, presence: true, length: { minimum: 1 }
  validates :amount,   presence: true, length: { minimum: 1 }
end
