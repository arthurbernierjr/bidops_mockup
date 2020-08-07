class CreateItemDataPropertyLedgers < ActiveRecord::Migration[6.0]
  def change
    create_table :item_data_property_ledgers do |t|
      t.references :item, null: false, foreign_key: true
      t.references :data_property, null: false, foreign_key: true
      t.float :data

      t.timestamps
    end
  end
end
