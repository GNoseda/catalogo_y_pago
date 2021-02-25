class CreateDigitals < ActiveRecord::Migration[5.2]
  def change
    create_table :digitals do |t|
      t.string :name
      t.integer :stock
      t.float :price
      t.string :sku

      t.timestamps
    end
  end
end
