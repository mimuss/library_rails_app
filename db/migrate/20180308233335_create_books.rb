class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name, limit: 2000
      t.string :cipher, limit: 100

      t.timestamps
    end
  end
end
