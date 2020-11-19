class Api::V1::AuthenticationController < ApplicationController
	skip_before_action :authenticate_request
   
	def authenticate
	  command = AuthenticateUser.call(auth_params[:email], auth_params[:password])
	  if command.success?
		user = User.find_by_email(command.email)
		render json: { user: user, auth_token: command.result }
	  else
		render json: { error: command.errors }, status: :unauthorized
	  end
	end

	private
	def auth_params
		params.require(:authentication).permit(:email, :password)
	end
end

   