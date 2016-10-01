class EventsController < ApplicationController
	def index
		@user=current_user
	  	loggedin?
	  	@events= Event.all
  	end

  	def create
  		event = Event.new(name:params[:name], date: params[:date], state:params[:state], user:current_user)
  		if event.valid?
			event.save
			flash[:errors] = ["Your event was successfully added!"]
			redirect_to "/events"
		else
			flash[:errors]= event.errors.full_messages
			redirect_to "/events"
		end	
  	end

	def show
		@event= Event.find(params[:id])
		@user=current_user
		loggedin?
	end

	def edit
		@event = Event.find(params[:id])
		@user= current_user
	end

	def update
		event = Event.find(params[:id])
		if event.update(event_params)
			redirect_to "/events"
		else
			flash[:errors]=event.errors.full_messages
			redirect_to "/events/#{event.id}/edit"
		end
	end

	def destroy
		event=Event.find(params[:id])
		event.destroy if event.user == current_user
		redirect_to "/events"
	end

	private 
 	def event_params
  		params.permit(:name, :date, :state)
 	end
end
