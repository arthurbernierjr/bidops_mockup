class DataAttribute < ApplicationRecord
  has_many :item_attribute_ledgers
  has_many :items, through: :item_attribute_ledgers
end
