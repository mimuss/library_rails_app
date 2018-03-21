class Book < ApplicationRecord

	validates :name, length: { minimum: 2, too_short: "слишком короткое (минимум %{count} символа)"}
	validates :cipher,  length: { minimum: 2, too_short: "слишком короткий (минимум %{count} символа)"}, 
						uniqueness: { message: "должен быть уникальным"}
	validates :library, presence: {message: "должна быть выбрана"}

	belongs_to :library
	has_many :subscribers, through: :grants

end
