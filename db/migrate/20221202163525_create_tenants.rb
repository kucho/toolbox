class CreateTenants < ActiveRecord::Migration[7.0]
  def change
    create_table(:tenants) do |t|
      t.uuid(:uuid, default: "gen_random_uuid()")
      t.string(:name)
      t.string(:slug)
      t.string(:logo)

      t.timestamps
    end
  end
end
