class CreateAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :data_attributes do |t|
      t.string :name

      t.timestamps
    end
  end
end
