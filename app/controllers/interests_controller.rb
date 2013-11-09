class InterestsController < ApplicationController
	def index
		@interests = Interest.all
	end

	def new
		@interest = Interest.new
 	end

	def create

		interest_params = params.require(:interest).permit(:topic)
		 @interest = Interest.new(interest_params)
  		 if @interest.save
  		 redirect_to @interest

        # Tell the UserMailer to send a welcome Email after save
          UserMailer.welcome_email(@interest).deliver
          #  format.html { redirect_to(@interest, notice: 'interest was successfully created.') }
          #  format.json { render json: @interest, status: :created, location: @interest }
          #else
          #  format.html { render action: 'new' }
          #  format.json { render json: @interest.errors, status: :unprocessable_entity }
         end
	end

	def show
		
		@interest = Interest.find(params[:id])
		
		client = YouTubeIt::Client.new
		@query = Interest.last.topic
		@videos = client.videos_by(:query => @query)

	end


	private

	def interest_params
		params.require('interest').permit(:topic)
	end

end

