class TicketTypesController < ApplicationController
  def index
     @ticket_types = TicketType.all
     render json: @ticket_types
  end

  def create
     @ticket_type = TicketType.create!(tickettype_params)
     render json: @ticket_type

  end

  def destroy
     @ticket_type = TicketType.find(params[:id])
     @ticket_type.destroy
     render json: @ticket_type
  end

  def update
     @ticket_type = TicketType.find(params[:id])
     @ticket_type.update_attributes!(event_params)
     render json: @ticket_type
  end

  def show
     @ticket_types = TicketType.find(params[:id])
     render json: @ticket_types
  end

  private
    def tickettype_params
# #<TicketType id: 1, event_id: 1, price: 20000, ticket_zone_id: 1, created_at: "2019-04-10 13:44:47", updated_at: "2019-04-10 13:44:47">,
      params.permit( :event_id, :price, :ticket_zone_id )

    end


end
