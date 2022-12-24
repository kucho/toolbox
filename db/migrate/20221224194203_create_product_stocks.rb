class CreateProductStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :product_stocks do |t|
      t.belongs_to :organization, null: false
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.float :unit_price

      t.timestamps
      t.index(
        %i[organization_id product_id unit_price],
        unique: true,
        name: "uniq_product_stock_in_org"
      )
    end
  end
end
