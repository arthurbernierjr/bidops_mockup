class Item < ApplicationRecord
  has_many :category_item_ledgers
  has_many :item_attribute_ledgers
  has_many :item_data_property_ledgers
  has_many :data_attributes, through: :item_attribute_ledgers
  has_many :categories, through: :category_item_ledgers
  has_many :data_properties, through: :item_data_property_ledgers
end
