class ChangeDateToNotNill < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :grants, :date, false
  end
end
