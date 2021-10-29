class BookingsController < ApplicationController
  before_action :set_user, only: [:create, :edit, :update]
  before_action :authenticate_user!

  def new
    @user = current_user
    @booking = Booking.new
    authorize @booking
  end

  def create
    @user = current_user
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.offer = @offer
    authorize @booking
    if @booking.save
      redirect_to bookings_path, notice: 'Booking creado exitosamente.'
    else
      redirect_to offer_path(@offer), alert: 'Wrong parmeters'
    end
  end

  def index
    @bookings = policy_scope(Booking)
    authorize @bookings
    @user = current_user
    @bookings = Booking.all
    @user_bookings = []
    @bookings.each do |booking|
      if booking.user_id == @user.id
        @user_bookings << booking
      end
    end
    @user_bookings
  end

  def edit
    @booking = policy_scope(Booking)
    authorize @booking
    @user = current_user
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = policy_scope(Booking)
    authorize @booking
    @user = current_user
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      @booking.rate.cost += 40
      redirect_to bookings_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :offer_id, :rate_id, :fec_ini, :fec_end)
  end

  def set_user
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end
end
