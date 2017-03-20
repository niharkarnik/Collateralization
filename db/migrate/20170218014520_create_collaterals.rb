class CreateCollaterals < ActiveRecord::Migration[5.0]
  def change
    create_table :collaterals do |t|
      t.string :field1
      t.string :field2
      t.string :field3
      t.string :field4
      t.string :field5
      t.string :margintype
      t.integer :quantity
      t.decimal :amount, precision: 15, scale: 3
      t.string :comparefield

      t.timestamps
    end
  end
end
