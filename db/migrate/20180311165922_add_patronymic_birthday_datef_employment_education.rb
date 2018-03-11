class AddPatronymicBirthdayDatefEmploymentEducation < ActiveRecord::Migration[5.1]
  def change
  	add_column :employees, :patronymic, :string, limit: 50
  	add_column :employees, :birthday, :date
  	add_column :employees, :date_of_employment, :date
  	add_column :employees, :education, :string, limit: 50
  	change_column_null :employees, :name, false
  	change_column_null :employees, :surname, false
  	change_column_null :employees, :position, false
  end
end
