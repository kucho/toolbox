class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table(:teams) do |t|
      t.belongs_to(:organization, null: false)
      t.uuid(:uuid, default: "gen_random_uuid()")
      t.string(:name)
      t.string(:description)

      t.timestamps
    end
  end
end
