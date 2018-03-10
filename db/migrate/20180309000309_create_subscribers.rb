class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.integer :number
      t.string :name, limit: 100
      t.string :surname, limit: 100
      t.string :address, limit: 100
      t.integer :phone
      t.references :library, foreign_key: true

      t.timestamps
    end
  end
end
