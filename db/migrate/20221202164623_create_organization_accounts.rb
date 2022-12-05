class CreateOrganizationAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table(:organization_accounts) do |t|
      t.references(:organization, null: false, foreign_key: true)
      t.references(:account, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
