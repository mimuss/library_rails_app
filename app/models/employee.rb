class Employee < ApplicationRecord

	validates :name, presence: true, length: { minimum: 2}
	validates :surname, presence: true, length: { minimum: 2}
	validates :position, presence: true, length: { minimum: 5}

  belongs_to :library
end
