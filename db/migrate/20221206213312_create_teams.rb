class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table(:teams) do |t|
      t.belongs_to(:organization, null: false)
      t.string(:name)
      t.string(:description)

      t.timestamps
    end
  end
end
