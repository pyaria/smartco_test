class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.string :project_title
      t.decimal :max_CFI
      t.date :final_decision
      t.string :institution

      t.timestamps null: false
    end
  end
end
