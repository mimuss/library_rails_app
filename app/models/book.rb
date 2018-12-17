class Book
	include Mongoid::Document
	include Mongoid::Attributes::Dynamic

	validates :name, length: { minimum: 2, too_short: "слишком короткое (минимум %{count} символа)"}
	validates :cipher,  length: { minimum: 2, too_short: "слишком короткий (минимум %{count} символа)"}, 
						uniqueness: { message: "должен быть уникальным"}
	validates :library, presence: {message: "должна быть выбрана"}

	field :name,           type: String
	field :cipher,         type: String
	field :author,         type: String
	field :publisher,      type: String
	field :published_date, type: Date
	field :price,          type: Float
	field :release_date,   type: Date

	belongs_to :library
	has_many :subscribers

	def price_to_comma
		self.price.to_s.gsub('.', ',')
	end

	def formatted_release_date
		self.release_date.strftime(date_format)
	end

	def formatted_published_date
		self.published_date.strftime(date_format)
	end

	private

	def date_format
		'%d-%m-%Y'
	end

end
