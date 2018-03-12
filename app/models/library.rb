class Library < ApplicationRecord

	validates :name, length: { minimum: 2, too_short: "слишком короткое (минимум %{count} символа)"}
	validates :address, length: { minimum: 2, too_short: "слишком короткий (минимум %{count} символа)"}
	validates :number, uniqueness: { message: "должен быть уникальным"}


	has_many :books
	has_many :employees
	has_many :subscribers

	private 
		

end
