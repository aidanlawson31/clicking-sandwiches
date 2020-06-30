class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :delete]
  before_action :set_reservation, only: [:show, :delete, :cancel, :confirm]
  before_action :set_location

  def index
    @reservations = @location.reservations
  end

  def show
  end

  def new
    @business    = @location.business
    @bda         = @business.business_display_attribute
    @reservation = @location.reservations.new
  end

  def create
    @reservation = @location.reservations.new(reservation_params)
    if @reservation.save
      puts "success"
    else
      puts "failure"
    end
  end

  def delete
  end

  def confirm
    # send email
    @reservation.status = "confirmed"
    if @reservation.status = "confirmed"
      redirect_to location_reservations_path(@location.id)
    else
      redirect_to location_reservations_path(@location.id)
    end 
  end

  def cancel
  end
  
  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_location
    if params[:location_id]
      @location = Location.find(params[:location_id])
    else
      @location = Location.find_by(location_url: params[:location_url])
    end
  end

  def reservation_params
    params[:reservation].permit(:name, :time, :number_of_people, :requirements, :phone_number, :email, :status)
  end
end
