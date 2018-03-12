class ReportsController < ApplicationController

	def index
	end

	def ajax
		puts params
		if (params[:model] == "books")
			@books = Book.order(params[:do])
			render 'books/_main_content.html.erb', :layout => false
		elsif (params[:model] == "employees")
			@employees = Employee.order(params[:do])
			render 'employees/_main_content.html.erb', :layout => false
		elsif (params[:model] == "subscribers")
			@subscribers = Subscriber.order(params[:do])
			render 'subscribers/_main_content.html.erb', :layout => false
		end
			
			
		
	end


end
