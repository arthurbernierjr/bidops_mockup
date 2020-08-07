class ItemDataPropertyLedger < ApplicationRecord
  belongs_to :item
  belongs_to :data_property
end
