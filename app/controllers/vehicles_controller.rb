class VehiclesController < ApplicationController
  def show
    @vehicle = Vehicle.find(params[:id])
  end
  
  def index
    if params[:search]
      @vehicles = Vehicle.where(vehicle_type: params[:search])
    else
      @vehicles = Vehicle.all
    end
  end
end
