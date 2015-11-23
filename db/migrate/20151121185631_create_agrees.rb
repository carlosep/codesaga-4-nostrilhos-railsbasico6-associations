class CreateAgrees < ActiveRecord::Migration
  def change
    create_table :agrees do |t|
      t.references :opinion, index: true

      t.timestamps null: false
    end
    add_foreign_key :agrees, :opinions
  end
end
