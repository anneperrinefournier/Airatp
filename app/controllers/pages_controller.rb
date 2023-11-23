class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @user_vehicles = current_user.vehicles
    @user_bookings = current_user.bookings

    @waiting_bookings = Booking.where(status: "pending", vehicle: @user_vehicles)
    @validated_bookings = Booking.where(status: "validated", vehicle: @user_vehicles)
  end

  def accept_booking
    @booking = Booking.find(params[:id])
    if current_user == @booking.vehicle.user && @booking.status == "pending"
      @booking.update(status: :validated)
      redirect_to dashboard_path
    end
  end

  def reject_booking
    @booking = Booking.find(params[:id])
    if current_user == @booking.vehicle.user && @booking.status == "pending"
      @booking.update(status: :refused)
      redirect_to dashboard_path
    end
  end
end
