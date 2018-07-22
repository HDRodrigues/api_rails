class ProductController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_action :verify_authenticity_token, only: [:create]

	def index
		@products = Product.all

		respond_to do |format|
			format.json { render :json => @products }
		end
	end
	
	def create
		@product = Product.new(product_params)

		if @product.save
			respond_to do |format|
				format.json { render :json => @product }
			end
		else
			render :nothing => true, :status => :bad_request
		end	
	end	

	def destroy
		@product = Product.find(params[:id])
		if @product.destroy
			respond_to do |format|
				format.json { render :json => @product }
			end
		else
			render :nothing => true, :status => :no_content
		end	
	end

	private 
		def product_params
			params.require(:product).permit(:name,:price,:category_id)
		end

end
