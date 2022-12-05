class CreateOrganizationActiveSessions < ActiveRecord::Migration[7.0]
  def change
    create_table(:organization_active_sessions) do |t|
      t.references(:organization, null: false, foreign_key: true)
      t.references(:account, null: false, foreign_key: true)
      t.references(:session_key, null: false, index: true)

      t.timestamps
    end
  end
end
