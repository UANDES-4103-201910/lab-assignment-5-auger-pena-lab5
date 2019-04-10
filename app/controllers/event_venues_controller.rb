class EventVenuesController < ApplicationController
  def index
     @venues = EventVenue.all
     render json: @venues
  end

  def show
     @venues = EventVenue.find(params[:id])
     render json: @venues
  end

  def create
     @eventvenue = EventVenue.create!(eventvenue_params)
     render json: @eventvenue

  end

  def destroy
     @venue = EventVenue.find(params[:id])
     @venue.destroy
     render json: @venue

  end

  def update
     @venue = EventVenue.find(params[:id])
     @venue.update_attributes!(eventvenue_params)
     render json: @venue

  end

  private
    def eventvenue_params
#  [#<EventVenue id: 1, name: "Estadio Nacional", address: "Maraton", capacity: 60000, created_at: "2019-04-10 13:44:47", updated_at: "2019-04-10 13:44:47">
      params.permit( :name, :address, :capacity)

    end


end
