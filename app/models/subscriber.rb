class Subscriber < ApplicationRecord

	validates :name, length: { minimum: 2, too_short: "слишком короткое (минимум %{count} символа)"}
	validates :surname, length: { minimum: 2, too_short: "слишком короткая (минимум %{count} символа)"}
	validates :address, length: { minimum: 3, too_short: "слишком короткий (минимум %{count} символа)"}
	validates :number, uniqueness: { message: "должен быть уникальным"}
	validates :phone, presence: { message: "должен присутствовать"}


  belongs_to :library
  has_many :books, through: :grants
end
