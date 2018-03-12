class Grant < ApplicationRecord

	validates :date, presence: {message: "должна присутствовать"}

	belongs_to :book
	belongs_to :subscriber
end
