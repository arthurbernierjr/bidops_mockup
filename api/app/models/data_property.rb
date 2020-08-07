class DataProperty < ApplicationRecord
  has_many :item_data_property_ledgers
  has_many :items, through: :item_data_property_ledgers
end
