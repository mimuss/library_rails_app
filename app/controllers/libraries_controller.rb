class LibrariesController < ApplicationController

  	def index
      if (params.has_key?(:libraries))
        ids = params[:libraries].map{ |lib| Integer(lib) }
        @libraries = Library.where(id: ids)
      else
        @libraries = Library.all
      end
  	end

	def new
		@library = Library.new
	end

	def edit 
		@library = Library.find(params[:id])
	end

	def update 
		@library = Library.find(params[:id])
		if @library.update(library_params)
			redirect_to libraries_path
		else
			render 'edit'
		end
	end

	def create
		@library = Library.new(library_params)
		if @library.save
			redirect_to libraries_path
		else
			render 'new'
		end
	end

	def destroy
		@library = Library.find(params[:id])
		@library.destroy
		redirect_to libraries_path
	end

	private

		def library_params
			params.require(:library).permit(:name, :address, :description, :number)
		end
end
