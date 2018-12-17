class Employee
	include Mongoid::Document

	validates :name, length: { minimum: 2, too_short: "слишком короткое (минимум %{count} символа)"}
	validates :surname, length: { minimum: 2, too_short: "слишком короткая (минимум %{count} символа)"}
	validates :position, length: { minimum: 5, too_short: "слишком короткая (минимум %{count} символа)"}

	field :name,               type: String
	field :surname,            type: String
	field :position,           type: String
	field :patronymic,         type: String
	field :birthday,           type: Date
	field :date_of_employment, type: Date
	field :education,          type: String

  belongs_to :library

	def formatted_birthday
		self.birthday.strftime(date_format)
	end

	def formatted_date_of_employment
		self.date_of_employment.strftime(date_format)
	end

	private

	def date_format
		'%d-%m-%Y'
	end

end
