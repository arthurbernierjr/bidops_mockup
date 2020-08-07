class Category < ApplicationRecord
  has_many :category_item_ledgers
  has_many :items, through: :category_item_ledgers
end
