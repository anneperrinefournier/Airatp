class VehiclesController < ApplicationController
  def show
    @vehicle = Vehicle.find(params[:id])
    @booking = Booking.new
  end

  def index
    if params[:vehicle_type]
      @vehicles = Vehicle.where(vehicle_type: params[:vehicle_type])
    else
      @vehicles = Vehicle.all
    end
  end

  def search_by_passengers
    number_of_passengers = params[:number_of_passengers]
    @vehicles = Vehicle.where(passengers_capacity: number_of_passengers)
    render json: @vehicles
  end
end
