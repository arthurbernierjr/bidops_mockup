class CreateItemAttributeLedgers < ActiveRecord::Migration[6.0]
  def change
    create_table :item_attribute_ledgers do |t|
      t.references :item, null: false, foreign_key: true
      t.references :data_attribute, null: false, foreign_key: true
      t.string :data

      t.timestamps
    end
  end
end
