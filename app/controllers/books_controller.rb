class BooksController < ApplicationController

	def index
		@books = Book.where(library_id: params[:library_id])
	end

	def new
		@book = Book.new
		@library = Library.find(params[:library_id])
	end

	def edit 
		@library = Library.find(params[:library_id])
		@libraries = Library.all
		@book = @library.books.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@libraries = Library.all
		@library = Library.find(params[:library_id])
		if @book.update(book_params)
			redirect_to library_books_path(@library)
		else
			render 'edit'
		end
	end

	def create
		@library = Library.find(params[:library_id])
		@book = @library.books.new(book_params)
		if @book.save
			redirect_to library_books_path(@library)
		else
			render 'new'
		end
	end

	def destroy 
		@library = Library.find(params[:library_id])
		Grant.where(book_id: params[:id]).destroy_all
		@library.books.find(params[:id]).destroy
		redirect_to library_books_path(@library)
	end

	private

		def book_params
			params.require(:book).permit(:name, :cipher, :author, :publisher, :published_date, :price, :release_date)
		end
end
