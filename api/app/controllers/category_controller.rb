class CategoryController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create,:destroy]

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

	def destroy
		@category = Category.find(params[:id])
		if @category.destroy
			respond_to do |format|
				format.json { render :json => @category }
			end
		else
			render :nothing => true, :status => :no_content
		end	
	end



	private
		def category_params
			params.require(:category).permit(:name)
		end

end
