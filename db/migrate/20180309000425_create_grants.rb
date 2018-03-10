class CreateGrants < ActiveRecord::Migration[5.1]
  def change
    create_table :grants do |t|
      t.datetime :date
      t.references :book, foreign_key: true
      t.references :subscriber, foreign_key: true

      t.timestamps
    end
  end
end
