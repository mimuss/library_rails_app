class Library < ApplicationRecord

	validates :name, length: { minimum: 2, too_short: "слишком короткое (минимум %{count} символа)"}
	validates :address, length: { minimum: 2, too_short: "слишком короткий (минимум %{count} символа)"}
	validates :number, uniqueness: { message: "должен быть уникальным"}


	has_many :books, dependent: :delete_all
	has_many :employees, dependent: :delete_all
	has_many :subscribers, dependent: :delete_all

	private 
		

end
