class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table(:products) do |t|
      t.belongs_to(:organization, null: false)
      t.uuid(:uuid, default: "gen_random_uuid()")
      t.string(:name)

      t.timestamps
    end
  end
end
