class FeedbanksController < ApplicationController

	def index
		@currentPage = {:useraccount => "active"};
		@user_name = "Account Login"
		@feedbanks = Feedbank.all
	end
end
