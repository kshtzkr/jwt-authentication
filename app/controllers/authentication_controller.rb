class AuthenticationController < ApplicationController
	skip_before_action :authenticate_request

	def create
		email = params[:email]
		password = params[:password]
		password_confirmation = params[:password_confirmation]
		email_check = email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
		@user = User.find_by(email: email)
		if email_check != 0
			render json: { status: 404, message: "email not valid" }
		elsif password != password_confirmation
			render json: { status: 404, message: "password mismatch" }
		elsif @user.present?
			render json: { status: 404, message: "User already exist" }
		elsif email.present? && password == password_confirmation
			User.create!(email:email,password:password,password_confirmation:password_confirmation)
			render json: { status: 200, message: "User is created" }
		end
	end
	
	def authenticate
		command = AuthenticateUser.call(params[:email], params[:password])

		if command.success?
			render json: { auth_token: command.result }
		else
			render json: { error: command.errors }, status: :unauthorized
		end
	end
end