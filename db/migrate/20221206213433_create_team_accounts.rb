class CreateTeamAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table(:team_accounts) do |t|
      t.belongs_to(:organization, null: false)
      t.references(:account, null: false, foreign_key: true)
      t.references(:team, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
