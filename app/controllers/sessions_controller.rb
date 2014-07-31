class SessionsController < ApplicationController

	
	def new
		@currentPage = {:useraccount => "active"};
	end

	def create
		@currentPage = {:useraccount => "active"};
		user = User.find_by_email(params[:name][:email])
		if user && user.authenticate(params[:name][:email])
		# Sign the user in and redirect to the user's show page.
			redirect_to @user
		else
			raise "Username and email do not match"
			render 'new'
		end
	end

	def destroy
		@currentPage = {:useraccount => "active"};
	end

end
