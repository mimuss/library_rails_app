class ChangeColumnsToBooks < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :books, :name, false
  	change_column_null :books, :name, false
  end
end
