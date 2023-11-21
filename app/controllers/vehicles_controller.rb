class VehiclesController < ApplicationController
  def index
    if params[:search]
      @vehicles = Vehicle.where(vehicle_type: params[:search])
    else
      @vehicles = Vehicle.all
    end
  end
end
