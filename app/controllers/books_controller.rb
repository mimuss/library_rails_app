class BooksController < ApplicationController

	def all_books
		if params.has_key?(:books)
			@books = Book.where(id: book_ids)
		else
			@books = Book.all
		end
		render 'index'
	end

	def index
		if params.has_key?(:books)
			@books = Book.where(library_id: params[:library_id], id: book_ids)
		else
			@books = Book.where(library_id: params[:library_id])
		end
		@library = Library.find(params[:library_id])
	end

	def new
		@book = Book.new
		if params.has_key?(:library_id)
			@library = Library.find(params[:library_id])
		end
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
		if params.has_key?(:library_id)
			@library = Library.find(params[:library_id])
			@book = @library.books.new(book_params)
		else
			@book = Book.new(book_params_without_library)
		end
		if @book.save and defined?(@library)
			redirect_to library_books_path(@library)
		elsif not defined?(@library) and @book.save
			redirect_to all_books_path
		else
			render 'new'
		end

	end

	def destroy 
		@library = Library.find(params[:library_id])
		Grant.where(book_id: params[:id]).destroy_all
		@library.books.find(params[:id]).destroy
		#redirect_to library_books_path(@library)
		redirect_to request.env["HTTP_REFERER"]
	end

	private

	def book_ids
		params[:books].map {|book_id| Integer(book_id)}
	end

	def book_params_without_library
		params.require(:book).permit(:name, :cipher, :author, :publisher, :published_date, :price, :release_date, :library_id)
	end

	def book_params
		params.require(:book).permit(:name, :cipher, :author, :publisher, :published_date, :price, :release_date)
	end
end
