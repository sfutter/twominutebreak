class WelcomeController < ApplicationController
  
  	def index
  		client = YouTubeIt::Client.new
		@videos = client.videos_by(:query => "penguin")
  	end


	def show
		client = YouTubeIt::Client.new
		@videos = client.videos_by(:query => "penguin")
	end


end
