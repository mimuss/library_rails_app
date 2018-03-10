class GrantsController < ApplicationController

	def list_by_book
		@grants = Grant.where(book_id: params[:book_id])
		render 'index'
	end

	def list_by_subscriber
		@grants = Grant.where(subscriber_id: params[:subscriber_id])
		render 'index'
	end

	def index
		@grants = Grant.all
	end

	def new
		@grant = Grant.new
		@books = Book.all
		@subscribers = Subscriber.all
	end

	def create
		@grant = Grant.new(grant_params)
		@books = Book.all
		@subscribers = Subscriber.all
		if @grant.save
			redirect_to grants_path
		else
			render 'new'
		end
	end

	def edit
		@grant = library
		@books = Book.all
		@subscribers = Subscriber.all
	end

	def update
		if library.update(grant_params)
			redirect_to grants_path
		else
			render 'edit'
		end
	end

	def destroy
		library.destroy
		redirect_to grants_path
	end

	private 

		def library 
			Grant.find(params[:id])
		end

		def grant_params
			params.require("grant").permit(:subscriber_id, :book_id, :date)
		end
end
