class SessionsController < ApplicationController

	def show
		@user = User.find(params[:id])
		if signed_in? && cookies.permanent[:remember_token] == @user.remember_token
    		@currentPage = {:useraccount => "active"};
  		else 
  			render 'new'
  		end
  	end

	def new
		@currentPage = {:useraccount => "active"};
	end

	def create
		@currentPage = {:useraccount => "active"};
		user = User.find_by_name(params[:session][:name])
		if user && user.authenticate(params[:session][:password])
		# you can access @user in views
			sign_in user
			redirect_to user
		else
			flash[:error] = 'Invalid email/password combination' # Not quite right!
			render 'new'
		end
	end

	def destroy
		@currentPage = {:useraccount => "active"};
	end

end
