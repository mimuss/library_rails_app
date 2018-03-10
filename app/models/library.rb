class Library < ApplicationRecord

	validates :name, presence: true, length: { minimum: 2} 
	validates :address, presence: true, length: { minimum: 2}

	has_many :books
	has_many :employees
	has_many :subscribers
end
