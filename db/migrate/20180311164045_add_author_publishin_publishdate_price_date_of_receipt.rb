class AddAuthorPublishinPublishdatePriceDateOfReceipt < ActiveRecord::Migration[5.1]
  def change
  	add_column :books, :author, :string, limit: 50
  	add_column :books, :publisher, :string, limit: 50
  	add_column :books, :published_date, :date
  	add_column :books, :price, :float
  	add_column :books, :release_date, :date
  end
end
