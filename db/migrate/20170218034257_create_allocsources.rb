class CreateAllocsources < ActiveRecord::Migration[5.0]
  def change
    create_table :allocsources do |t|
      t.date :allocationdate
      t.integer :allocationrunseq
      t.references :source, foreign_key: true
      t.integer :sourceallocquantity
      t.references :collateral, foreign_key: true
      t.integer :collateralallocquantity

      t.timestamps
    end
  end
end
