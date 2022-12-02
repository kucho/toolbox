class CreateTenantAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :tenant_accounts do |t|
      t.references :tenant, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
