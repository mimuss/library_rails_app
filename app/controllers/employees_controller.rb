class EmployeesController < ApplicationController

	def index
		@employees = Employee.where(library_id: params[:library_id])
		@library = Library.find(params[:library_id])
	end

	def new
		@employee = Employee.new
		@library = Library.find(params[:library_id])
	end

	def edit
		@library = Library.find(params[:library_id])
		@employee = @library.employees.find(params[:id])
		@libraries = Library.all
	end

	def update
		@library = Library.find(params[:library_id])
		@employee = @library.employees.find(params[:id])
		if @employee.update(employee_params_for_update)
			redirect_to library_employees_path(@library)
		else
			render 'edit'
		end
	end

	def create
		@library = Library.find(params[:library_id])
		@employee = @library.employees.new(employee_params)
		if @employee.save
			redirect_to library_employees_path(@library)
		else
			render 'new'
		end
	end

	def destroy
		@library = Library.find(params[:library_id])
		@employee = @library.employees.find(params[:id])
		@employee.destroy
		redirect_to library_employees_path(@library)
	end

	private

		def employee_params_for_update
			params.require(:employee).permit(:surname, :name, :position, :library_id)
		end

		def employee_params
			params.require(:employee).permit(:surname, :name, :position)
		end

end
