class AddDateOfReturnToGrants < ActiveRecord::Migration[5.1]
  def change
    add_column :grants, :date_of_return, :date
  end
end
