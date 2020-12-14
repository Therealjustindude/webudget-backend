class Api::V1::UsersController < ApplicationController
	before_action :set_user, only: [:show, :update, :destroy]
	# def index
	# 	@user = User.all
	# 	render json: @user
	# end

	def show
		render json: @user 
	end

	def create
		@user = User.new(user_params)
		if @user.save 
			token = JsonWebToken.encode(user_id: @user.id)
			render json: { user: @user, auth_token: token }
		else
			render json: { error: @user.errors.messages }, status: :unauthorized
		end
		
	end

	def update
		if @user.update(:paid => true)
			render json: @user
		else
		render json: @user.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@user.destroy
	end

	private
	def set_user
		@user = User.find(params[:id])
	end
	
	def user_params
		params.require(:user).permit(:user_name, :password, :email)
	end
end
