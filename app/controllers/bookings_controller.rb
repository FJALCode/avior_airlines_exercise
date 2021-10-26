class BookingsController < ApplicationController
  before_action :set_user, only: [:create, :edit, :update]
  def new
    @user = current_user
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.save
    redirect_to bookings_path
  end

  def index
    @bookings = Booking.all
  end

  def edit
    @user = current_user
    @booking = Booking.find(params[:id])
  end

  def update
    @user = current_user
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :offer_id, :rate_id)
  end

  def set_user
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end
end