class BookingsController < ApplicationController
  def create
    @booking = Booking.new(bookings_params)
    @game = Game.find(params[:game_id])
    @booking.game = @game
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to dashboard_path
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
