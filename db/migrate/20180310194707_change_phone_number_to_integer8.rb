class ChangePhoneNumberToInteger8 < ActiveRecord::Migration[5.1]
  def change
  	change_column :subscribers, :number, :integer, limit: 8
  end
end
