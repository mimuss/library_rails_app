class AlterSubsctiptionRemovePhoneAddPhoneBigInt < ActiveRecord::Migration[5.1]
  def change
  	remove_column :subscribers, :number, :integer
  	change_column :subscribers, :phone, :integer, limit: 8
  end
end
