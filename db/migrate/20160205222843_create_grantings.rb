class CreateGrantings < ActiveRecord::Migration
  def change
    create_table :grantings do |t|
      t.references :grant, index: true, foreign_key: true
      t.references :scientist, index: true, foreign_key: true
      t.string :role

      t.timestamps null: false
    end
  end
end
