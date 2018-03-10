class AddLibraryToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :library, foreign_key: true
  end
end
