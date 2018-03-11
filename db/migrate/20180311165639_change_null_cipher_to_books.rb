class ChangeNullCipherToBooks < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :books, :cipher, false
  end
end
