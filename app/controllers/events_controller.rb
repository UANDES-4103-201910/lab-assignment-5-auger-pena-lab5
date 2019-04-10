class EventsController < ApplicationController
  def index
     @events = Event.all
     render json: @events
  end

  def create
     @event = Event.create!(event_params)
     render json: @event
  end

  def destroy
     @event = Event.find(params[:id])
     @event.destroy
     render json: @event

  end

  def update
     @event = Event.find(params[:id])
     @event.update_attributes!(event_params)
     render json: @event
  end

  def show
     @events = Event.find(params[:id])
     render json: @events

  end

  def upcoming_events
     @events = Events.where(:start_date => Time.now..(Time.now+3.months))
  end

  private
    def event_params
      params.permit( :name, :description, :start_date, :event_venue_id)
#  curl http://138.122.226.32:3000/events -X POST -d "name=WENA&description=hola&start_date=2019-04-10&event_venue_id=1" | less

    end


end
