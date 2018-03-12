class SubscribersController < ApplicationController

	def index
		@library = Library.find(params[:library_id])
		@subscribers = @library.subscribers
	end

	def new
		@subscriber = Subscriber.new
		@library = Library.find(params[:library_id])
	end

	def edit
		@library = library
		@subscriber = @library.subscribers.find(params[:id])
	end

	def update
		@subscriber = Subscriber.find(params[:id])
		@library = Library.find(params[:library_id])
		if @subscriber.update(subscriber_params)
			redirect_to library_subscribers_path(@library)
		else
			render 'edit'
		end
	end

	def create
		@library = Library.find(params[:library_id])
		@subscriber = @library.subscribers.new(subscriber_params)
		if @subscriber.save
			redirect_to library_subscribers_path(@library)
		else
			render 'new'
		end
	end

	def destroy
		@library = library
		Grant.where(subscriber_id: params[:id]).destroy_all
		@library.subscribers.find(params[:id]).destroy
		redirect_to request.env["HTTP_REFERER"]
	end

	private 
		def subscriber_params
			params.require(:subscriber).permit(:number, :name, :surname, :patronymic, :address, :phone)
		end

		def library
			Library.find(params[:library_id])
		end

end
