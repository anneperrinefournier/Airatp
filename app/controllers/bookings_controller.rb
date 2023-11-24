class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @user_bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new(booking_params)
    @booking.vehicle = @vehicle
    @booking.user = current_user
    @booking.status = :pending
    # @booking.end_date = params[:end_date]

    @booking.total_price = (@booking.end_date - @booking.start_date) * @vehicle.price_per_day
    if @booking.save!
      redirect_to dashboard_path, notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
