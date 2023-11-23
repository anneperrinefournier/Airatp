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

    @markers = @vehicles.geocoded.map do |vehicle|
      {
        lat: vehicle.latitude,
        lng: vehicle.longitude
      }
    end
  end

end
