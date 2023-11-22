class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = @vehicle.bookings.new(booking_params)
    @booking.user = current_user
    @booking.status = :pending

    @booking.number_of_days = params[:vehicle][:number_of_days].to_i

    if @booking.save!
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
