class UsersController < ApplicationController
  def index
     @users = User.all
     render json: @users
  end

  def create
     @user = User.create!(user_params)
     render json: @user

  end

  def destroy
     @user = User.find(params[:id])
     @user.destroy
     render json: @user
  end

  def update
     @user = User.find(params[:id])
     @user.update_attributes!(event_params)
     render json: @user
  end

  def show
     @users = User.find(params[:id])
     render json: @users
  end

  def user_with_most_tickets
#      @user = User.first
     @user =  User.find(Ticket.joins(:order).select('orders.user_id').group('user_id').count().max_by{|k,v| v}[0])

     render json: @user
  end

  private
    def user_params
# #<User id: 1, name: "Claudio", lastname: "Alvarez", email: "calvarez1@miuandes.cl", password: "123456", address: "San Carlos de Apoquindo", created_at: "2019-04-10 13:44:47", updated_at: "2019-04-10 13:44:47">
      params.permit( :name, :lastname, :email,  :password, :address)

    end


end
