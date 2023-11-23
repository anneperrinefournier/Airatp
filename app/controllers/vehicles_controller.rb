class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to vehicles_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

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

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :photo, :vehicle_type, :address, :passengers_capacity, :price_per_day, :cruising_speed, :fuel_type, :ecological_label, :description)
  end
end
