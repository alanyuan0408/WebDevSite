class SessionsController < ApplicationController

	def show
    	@currentPage = {:useraccount => "active"};
  		@user = User.find(params[:id])
  	end

	def new
		@currentPage = {:useraccount => "active"};
	end

	def create
		@currentPage = {:useraccount => "active"};
		@user = User.find_by_name(params[:session][:name])
		if @user.email == params[:session][:email]
		# Sign the user in and redirect to the user's show page.
			redirect_to @user
		else
			@currentPage = {:usererror => "true"};
			@user.errors.add(:email, "email does not match")
			render 'new'
		end
	end

	def destroy
		@currentPage = {:useraccount => "active"};
	end

end
