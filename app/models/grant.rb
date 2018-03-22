class Grant < ApplicationRecord

	validates :date, presence: {message: "должна присутствовать"}

	belongs_to :book
	belongs_to :subscriber

	def formatted_date
		self.date.strftime(format_date)
	end

	def formatted_date_of_return
		self.date_of_return.strftime(format_date)
	end

	private

	def format_date
		'%d-%m-%Y'
	end
end
