class Book < ApplicationRecord

	validates :name, presence: true, length: { minimum: 2}
	validates :cipher, presence: true, length: { minimum: 3}, uniqueness: true

	belongs_to :library
	has_many :subscribers, through: :grants
end
