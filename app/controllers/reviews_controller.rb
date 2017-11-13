class ReviewsController < ApplicationController

    before_filter :regist_user

    def create              
     @product = Product.find_by(id: params[:product_id])
     @review = @product.reviews.new(review_params)    
     @review.user_id = current_user.id
        if @review.save
            redirect_to root_path
        else
            redirect_to product_path(params[:product_id])
        end
    end

    def destroy
        @product = Product.find_by(id: params[:product_id])
        @review = @product.reviews.find_by(id: params[:id]) 
        @review.destroy  
        redirect_to product_path(params[:product_id])
    end

    private
    def review_params
     params.require(:review).permit(:description, :rating)
    end

    def regist_user
        @user_id = current_user.id
    end

end
