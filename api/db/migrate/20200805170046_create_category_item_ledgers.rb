class CreateCategoryItemLedgers < ActiveRecord::Migration[6.0]
  def change
    create_table :category_item_ledgers do |t|
      t.references :category, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
