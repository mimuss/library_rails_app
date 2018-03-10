class Grant < ApplicationRecord

	validates :date, presence: true

	belongs_to :book
	belongs_to :subscriber
end
