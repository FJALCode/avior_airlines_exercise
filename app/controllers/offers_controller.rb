class OffersController < ApplicationController
  #   before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :set_offer, only: [:show]
  before_action :authenticate_user!, only: [:show, :edit]

  # GET /offers
  def index
    @offers = policy_scope(Offer)
    authorize @offers
    # @offers = Offer.all
    if params[:query].present?
      # @offers = Offer.where(cost: params[:query])
      #sql_query = "states.name ILIKE :query"
      # @offers = Offer.joins(:state).where(sql_query, query: "%#{params[:query]}%")
      @offers = Offer.global_search(params[:query])
    else
      # Luego de modificar el seed para que traiga TODAS las ofertas
      # cambiar *Offer.all* para mostrar un grupo reducido de Offers
      @offers = Offer.take(15)
    end

  end

  # GET /offers/1
  def show
    authorize @offer
    @state = State.find(@offer.state_id)
    @country = Countrie.find(@state.countrie_id)
    @booking = Booking.new
    @markers = [{
      lat: @state.latitude,
      lng: @state.longitude,
      info_window: render_to_string(partial: "info_window", locals: { state: @state }),
    }]
  end

  # GET /offers/1/edit
  def edit
    @offer = policy_scope(Offer)
    authorize @offer
    @offer = Offer.find(params[:id])
  end

  # PATCH/PUT /offers/1
  def update
    @offer = policy_scope(Offer)
    authorize @offer
    @offer = Offer.find(params[:id])
    @state = State.find(@offer.state_id)
    if @offer.update(offer_params)
      redirect_to @offer, notice: 'Offer was successfully updated.'
    else
      render :edit
    end
  end

  # GET /offers/new
  # def new
  #   @offer = Offer.new
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
    params.require(:offer).permit(:cost, :date, :photo_url)
  end
end
