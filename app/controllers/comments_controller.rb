class CommentsController < ApplicationController
	def create
		event = Event.find(params[:event_id])
		comment = Comment.create(content:params[:content], user:current_user, event:event)
		flash[:errors] = comment.errors.full_messages unless comment.save
		redirect_to "/events/#{event.id}"
	end
end
