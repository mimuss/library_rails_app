class ChangeColumnsToFalseNullToLibraries < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :libraries, :name, false
  	change_column_null :libraries, :address, false
  end
end
