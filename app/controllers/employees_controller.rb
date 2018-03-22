class EmployeesController < ApplicationController

	def index
		if params.has_key?(:employees)
			@employees = Employee.where(id: employee_ids, library_id: params[:library_id])
		else
			@employees = Employee.where(library_id: params[:library_id])
		end
			@library = Library.find(params[:library_id])
	end

	def all_employees
		if params.has_key?(:employees)
			@employees = Employee.where(id: employee_ids)
		else
			@employees = Employee.all
		end
		render 'index'
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)
		if @employee.save
			redirect_to library_employees_path(@employee.library)
		else
			render 'new'
		end
	end

	def edit
		@employee = Employee.find(params[:id])
	end

	def update
		@employee = Employee.find(params[:id])
		if @employee.update(employee_params)
			redirect_to library_employees_path(@employee.library)
		else
			render 'edit'
		end
	end

	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy
		redirect_to library_employees_path(@employee.library)
	end

	private

		def employee_ids
			params[:employees].map { |em_id| Integer(em_id)}
		end

		def employee_params
			params.require(:employee).permit(:surname, :name, :position, :library_id,
			 :birthday, :date_of_employment, :education, :patronymic, :library_id)
		end

end
