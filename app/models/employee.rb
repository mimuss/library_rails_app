class Employee < ApplicationRecord

	validates :name, length: { minimum: 2, too_short: "слишком короткое (минимум %{count} символа)"}
	validates :surname, length: { minimum: 2, too_short: "слишком короткая (минимум %{count} символа)"}
	validates :position, length: { minimum: 5, too_short: "слишком короткая (минимум %{count} символа)"}
	
  belongs_to :library
end
