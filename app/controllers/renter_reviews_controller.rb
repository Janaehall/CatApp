class RenterReviewsController < ApplicationController
  before_action :authorized, only: [:new, :edit, :destroy]
  
  def new
    @renter = Reservation.find_by(id: params[:id]).renter
    @renter_review = RenterReview.new
    @reservation_id = params[:id]
    if session[:user_id] == Reservation.find_by(id: @reservation_id).cat.owner_id
      render :new
    else 
      flash[:errors] = ["You are not authorized to review this renter!"] 
      redirect_to user_path(session[:user_id])
    end
  end
  
  def create
    @renter_review = RenterReview.new(renter_review_params)
    if @renter_review.save
      redirect_to @renter_review.reservation
    else
      flash[:errors] = @renter_review.errors.full_messages
      redirect_to new_renter_review_path(params[:renter_review][:reservation_id])
    end
  end
  
  private
  
  def find_renter_review
    RenterReview.find(params[:id])
  end
  
  def renter_review_params
    params.require(:renter_review).permit(:rating, :review, :reservation_id)
  end
  

end