class FeedbanksController < ApplicationController

	def show
		@feedbanks = Feedbank.all
	end
end
