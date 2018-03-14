class ReportsController < ApplicationController

	def index
		if (!params.has_key?(:date))
			render 'index'
			return
		end
		@start_on = params[:date][:start_on]
		@end_on = params[:date][:end_on]
		if check_report_book_params
			@books = Book.joins("INNER JOIN grants ON grants.book_id = books.id").where('grants.date' => Date.new(2001,1,1)..Date.today)
			puts @books
		else
			@error_message = "Неправильно введены даты"
		end

	end


	private

		def report_book_params
			params.require(:date).permit(:start_on, :end_on)
		end

		def check_report_book_params
			begin 
				end_on > start_on
			rescue ArgumentError
				return false
			end
			#return (report_book_params[:end_on] == "" or report_book_params[:start_on] == "" or end_on > start_on)
		end

		def end_on
			return Date.parse report_book_params[:end_on]
		end

		def start_on 
			return Date.parse report_book_params[:start_on]
		end

end
