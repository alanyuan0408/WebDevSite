class SessionsController < ApplicationController

	def new
		@currentPage = {:useraccount => "active"};
		@user_name = "Login"
	end

	def create
		@currentPage = {:useraccount => "active"};
		user = User.find_by_name(params[:session][:name])
		if user && user.authenticate(params[:session][:password])
		# you can access @user in views
			sign_in user
			redirect_to user
		else
			flash[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		@currentPage = {:useraccount => "active"};
		@user_name = "Login"
		self.current_user = nil
		cookies.delete(:remember_token)
		session[:remember_token] = nil
		render 'new'
	end

end
