class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table(:profiles) do |t|
      t.string(:first_name)
      t.uuid(:uuid, default: "gen_random_uuid()")
      t.string(:last_name)
      t.references(:account, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
