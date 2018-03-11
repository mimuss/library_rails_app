class AddPatronymicChangeToNotNullToSubscribers < ActiveRecord::Migration[5.1]
  def change
  	add_column :subscribers, :number, :integer, null: false
  	add_column :subscribers, :patronymic, :string, limit: 50
  	change_column_null :subscribers, :surname, false
  	change_column_null :subscribers, :name, false
  	change_column_null :subscribers, :address, false
  	change_column_null :subscribers, :phone, false
  end
end
