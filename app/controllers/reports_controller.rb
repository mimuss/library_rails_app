class ReportsController < ApplicationController

	def index
		if (params[:model] == "books")
			@books = Book.all
		end
	end

end
