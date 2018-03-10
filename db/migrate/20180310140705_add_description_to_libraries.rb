class AddDescriptionToLibraries < ActiveRecord::Migration[5.1]
  def change
    add_column :libraries, :description, :string, limit: 2000
  end
end
