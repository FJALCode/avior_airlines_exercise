class OffersController < ApplicationController
  #   before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :set_offer, only: [:show]

  # GET /offers
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  def show
    @state = State.find(@offer.state_id)
    @country = Countrie.find(@state.countrie_id)
    @markers = [{
      lat: @state.latitude,
      lng: @state.longitude,
      info_window: render_to_string(partial: "info_window", locals: { state: @state }),
    }]
  end

  # GET /offers/new
  # def new
  #   @offer = Offer.new
  # end

  # GET /offers/1/edit
  # def edit
  # end

  # POST /offers
  # def create
  #   @offer = Offer.new(offer_params)

  #   if @offer.save
  #     redirect_to @offer, notice: 'Offer was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  # PATCH/PUT /offers/1
  # def update
  #   if @offer.update(offer_params)
  #     redirect_to @offer, notice: 'Offer was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /offers/1
  # def destroy
  #   @offer.destroy
  #   redirect_to offers_url, notice: 'Offer was successfully destroyed.'
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def offer_params
    params.require(:offer).permit(:state_id)
  end
end
