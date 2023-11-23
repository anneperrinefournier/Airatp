class VehiclesController < ApplicationController
  def show
    @vehicle = Vehicle.find(params[:id])
    @booking = Booking.new
  end

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
  end
end


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
