class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show edit update destroy]

  def index
    if params[:vehicle_type]
      @vehicles = Vehicle.where(vehicle_type: params[:vehicle_type])
    else
      @vehicles = Vehicle.all
    end
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    if user_signed_in?
      @vehicle = Vehicle.new(vehicle_params)
      @vehicle.user = current_user
      if @vehicle.save
        redirect_to dashboard_path
      else
        render 'new', status: :unprocessable_entity
      end
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    @booking = Booking.new
    @user = current_user
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if vehicle.user == current_user
      @vehicle = Vehicle.new(vehicle_params)
      if @vehicle.save
        redirect_to vehicle_path(@vehicle)
      else
        render 'edit', status: :unprocessable_entity
      end
    end
  end

  def destroy
    if current_user == @vehicle.user
      @vehicle.destroy
      redirect_to dashboard_path, status: :see_other
    end
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :photo, :vehicle_type, :address, :passengers_capacity, :price_per_day, :cruising_speed, :fuel_type, :ecological_label, :description)
  end
end
