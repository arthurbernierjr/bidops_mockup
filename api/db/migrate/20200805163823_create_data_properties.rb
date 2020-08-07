class CreateDataProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :data_properties do |t|
      t.string :name

      t.timestamps
    end
  end
end
