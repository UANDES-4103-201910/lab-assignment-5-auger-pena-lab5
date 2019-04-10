class TicketsController < ApplicationController
  def index
     if(params.has_key?(:ticket_type_id))
        @tickets = Ticket.where(:ticket_type_id => params[:ticket_type_id])
     else
        @tickets = Ticket.all
     end
     render json: @tickets


  end

  def show
     @ticket = Ticket.find(params[:id])
     render json: @ticket
  end

  def create
     @ticket = Ticket.create!(ticket_params)
     render json: @ticket

  end

  def destroy
     @ticket = Ticket.find(params[:id])
     @ticket.destroy
     render json: @ticket
  end

  def update
     @ticket = Ticket.find(params[:id])
     @ticket.update_attributes!(ticket_params)
     render json: @ticket

  end

  private
    def ticket_params
      # #<Ticket id: 1, ticket_type_id: 2, order_id: 1, created_at: "2019-04-10 13:44:48", updated_at: "2019-04-10 13:44:48">,
      params.permit( :ticket_type_id, :order_id)

    end


end
