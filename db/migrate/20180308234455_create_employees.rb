class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name, limit: 100
      t.string :surname, limit: 100
      t.string :position, limit: 256
      t.references :library, foreign_key: true

      t.timestamps
    end
  end
end
