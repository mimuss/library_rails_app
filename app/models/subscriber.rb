class Subscriber < ApplicationRecord

	validates :name, presence: true, length: {minimum: 2}
	validates :surname, presence: true, length: {minimum: 2}
	validates :address, length: { minimum: 3}
	validates :number, presence: true, uniqueness: true


  belongs_to :library
  has_many :books, through: :grants
end
