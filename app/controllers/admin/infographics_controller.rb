module Admin
	class InfographicsController < ApplicationController
		before_action :authenticate_user!
		before_action :set_infographic, only: [:destroy]
		def index
			@infographics = Infographic.all
		end

		def new
			@infographic = Infographic.new
		end

		def create
			@infographic = Infographic.new(infographic_params)

			if @infographic.save
				redirect_to admin_infographics_path
			else
				render :new
			end
		end

		def destroy
			@infographic.destroy
			redirect_to admin_infographics_path
		end

		private

		def infographic_params	
				params.require(:infographic).permit(:image)
		end

		def set_infographic
			@infographic = Infographic.find(params[:id])
		end
	end
end
