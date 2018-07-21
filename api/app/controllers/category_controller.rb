class CategoryController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

	def index
		@categories = Category.all

		respond_to do |format| 
			format.json { render :json => @categories}
		end
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			respond_to do |format|
				format.json { render :json => @category }
			end
		else
			render :nothing => true, :status => :bad_request
		end	
	end



	private
		def category_params
			params.require(:category).permit(:name)
		end

end
