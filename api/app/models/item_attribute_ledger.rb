class ItemAttributeLedger < ApplicationRecord
  belongs_to :item
  belongs_to :data_attribute
end
