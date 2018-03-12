class GrantsController < ApplicationController

	def index
		if (params.has_key?(:book_id)) 
			@grants = Grant.where(book_id: params[:book_id])
			@book = Book.find(params[:book_id])
		elsif (params.has_key?(:subscriber_id))
			@grants = Grant.where(subscriber_id: params[:subscriber_id])
			@subscriber = Subscriber.find(params[:subscriber_id])
		end
	end

	def new
		@grant = Grant.new
		if (params.has_key?(:book_id))
			@book = Book.find(params[:book_id])
			@subscribers = @book.library.subscribers
		elsif (params.has_key?(:subscriber_id))
			@subscriber = Subscriber.find(params[:subscriber_id])
			@books = @subscriber.library.books	
		end
	end

	def create
		if (params.has_key?(:book_id))
			@book = Book.find(params[:book_id])
			@grant = Grant.new(params.require(:grant).permit(:subscriber_id, :date, :date_of_return))
			@grant.book = @book
			@subscribers = @book.library.subscribers
			if @grant.save
				redirect_to library_book_grants_path(@book.library, @book)
			else
				render 'new'
			end
		elsif (params.has_key?(:subscriber_id)) 
			@subscriber = Subscriber.find(params[:subscriber_id])
			@grant = Grant.new(params.require(:grant).permit(:book_id, :date, :date_of_return))
			@grant.subscriber = @subscriber
			@books = @subscriber.library.books
			if @grant.save
				redirect_to library_subscriber_grants_path(@subscriber.library, @subscriber)
			else
				render 'new'
			end
		end		
	end

	def edit
		@grant = Grant.find(params[:id])
		if (params.has_key?(:book_id))
			@book = Book.find(params[:book_id])
			@subscribers = @book.library.subscribers
		elsif (params.has_key?(:subscriber_id))
			@subscriber = Subscriber.find(params[:subscriber_id])
			@books = @subscriber.library.books
		end
	end

	def update
		@grant = Grant.find(params[:id])
		if (params.has_key?(:book_id) and @grant.update(params.require(:grant).permit(:subscriber_id, :date, :date_of_return))) 
			@book = Book.find(params[:book_id])
			redirect_to library_book_grants_path(@book.library, @book)
		elsif (params.has_key?(:subscriber_id) and @grant.update(params.require(:grant).permit(:book_id, :date, :date_of_return)))
			@subscriber = Subscriber.find(params[:subscriber_id])
			redirect_to library_subscriber_grants_path(@subscriber.library, @subscriber)
		end
	end

	def destroy
		if (params.has_key?(:book_id))
			Grant.find(params[:id]).destroy
			@book = Book.find(params[:book_id])
			redirect_to library_book_grants_path(@book.library, @book)
		elsif (params.has_key?(:subscriber_id))
			Grant.find(params[:id]).destroy
			@subscriber = Subscriber.find(params[:subscriber_id])
			redirect_to library_subscriber_grants_path(@subscriber.library, @subscriber)
		end
	end

	private 

end
