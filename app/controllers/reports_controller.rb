class ReportsController < ApplicationController

	@@sorted_valeus = {
		"created_at_desc" => "created_at DESC",
		"created_at" => "created_at",
		"name" => "name"
	}


	def index

		if (!params.has_key?(:date) or !params.has_key?(:sort))
			render 'index'
			return
		end

		@sort_on = params[:sort][:sort_on]
		@start_on = params[:date][:start_on]
		@end_on = params[:date][:end_on]


		if check_report_book_params
			if params.has_key?(:sort) and @@sorted_valeus.has_key?(params[:sort][:sort_on])
				@books = Grant.joins(:subscriber, book: :library).where('grants.date' => @start_on..@end_on).select('books.*,
				grants.date as grants_date, subscribers.name as subcribers_name,
				subscribers.surname as subscribers_surname, books.library_id as books_library_id').order(@@sorted_valeus[sort_params[:sort_on]])
			elsif params.has_key?(:sort) and params[:sort][:sort_on] == "top"
				@top_books = Grant.joins(:book).where('grants.date' => @start_on..@end_on).select('books.*').group(:name, :cipher, :author, :publisher, :price).count()
				@top_books.each do |key, value|
					key.map {|val| val.to_s.gsub('.', ',') if val.class == Float}
				end
			end
		else
			@error_message = "Неправильно введены даты"
		end

	end


	private

		def sort_params
			params.require(:sort).permit(:sort_on) 
		end

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
