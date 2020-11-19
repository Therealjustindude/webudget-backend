class ApplicationController < ActionController::API
	before_action :authenticate_request, unless: :this_is_true?
	attr_reader :current_user
  
	private
  
	def authenticate_request
	  @current_user = AuthorizeApiRequest.call(request.headers).result
	  render json: { error: 'Not Authorized' }, status: 401 unless @current_user
	end

	def this_is_true?
		request.headers['method'] === "USER_POST"
	end
end
