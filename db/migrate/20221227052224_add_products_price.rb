class AddProductsPrice < ActiveRecord::Migration[7.0]
  def change
    add_monetize :products, :price, currency: { null: true, default: nil }
  end
end
