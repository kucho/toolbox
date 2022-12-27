class AddDefaultCurrencyToOrg < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :default_currency, :string, default: "usd"
  end
end
