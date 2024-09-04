class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
