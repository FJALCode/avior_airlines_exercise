class PagesController < ApplicationController
  def home
    @offers = Offer.first(9)
  end
end
