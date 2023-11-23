class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show edit update destroy]

  def index
    if params[:vehicle_type].present?
      @vehicles = Vehicle.where(vehicle_type: params[:vehicle_type])
    elsif params[:queryname].present? && params[:passengers_capacity].present?
      @vehicles = Vehicle.where("name ILIKE ?", "%#{params[:queryname]}%")
                         .merge(passengers_capacity_range)

    elsif params[:queryname].present?
      @vehicles = Vehicle.where("name ILIKE ?", "%#{params[:queryname]}%")
    elsif params[:passengers_capacity].present?
      passengers_capacity_range
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

  def passengers_capacity_range
    capacity = params[:passengers_capacity].to_i
    case capacity
    when 1
      @vehicles = Vehicle.where(passengers_capacity: capacity)
    when 2..5
      @vehicles = Vehicle.where('passengers_capacity BETWEEN ? AND 5', capacity)
    when 6..10
      @vehicles = Vehicle.where('passengers_capacity BETWEEN ? AND 10', capacity)
    when 11..50
      @vehicles = Vehicle.where('passengers_capacity BETWEEN ? AND 50', capacity)
    when 51..100
      @vehicles = Vehicle.where('passengers_capacity BETWEEN ? AND 100', capacity)
    when 101..200
      @vehicles = Vehicle.where('passengers_capacity BETWEEN ? AND 200', capacity)
    when 201..300
      @vehicles = Vehicle.where('passengers_capacity BETWEEN ? AND 300', capacity)
    else
      @vehicles = Vehicle.where('passengers_capacity >= ?', capacity)
    end
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :photo, :vehicle_type, :address, :passengers_capacity, :price_per_day, :cruising_speed, :fuel_type, :ecological_label, :description)
  end
end
