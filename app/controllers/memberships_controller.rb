class MembershipsController < ApplicationController
	def create
		membership= Membership.create(user:current_user, event: Event.find(params[:event_id]))
		redirect_to "/events"
	end

	def destroy
		membership = Membership.find_by(event:params[:event_id], user:current_user)
		membership.destroy
		redirect_to "/events" 
	end
end
