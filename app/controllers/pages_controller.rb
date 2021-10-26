class PagesController < ApplicationController
  def home
    @states = State.first(10)
  end
end
