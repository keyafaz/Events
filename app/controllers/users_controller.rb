class UsersController < ApplicationController
	before_action :require_login, except: [:create]
	before_action :require_correct_user, only: [:show, :update, :destroy]
	
	def create 
		user = User.new(user_params)
		if user.valid?
			user.save
			session[:user_id] = user.id
			redirect_to "/events"
		else
			flash[:errors]= user.errors.full_messages
			redirect_to "/"
		end
	end

	def show
		@user= User.find(current_user)
	end

	def update
		user= User.find(current_user)
		if user.update(user_params)
			redirect_to "/events"
		else
			flash[:errors]=user.errors.full_messages
			redirect_to "/users/#{user.id}"
		end
	end
	
	private 
 	def user_params
  		params.permit(:name, :email, :password, :password_confirmation, :city, :state)
 	end
end
