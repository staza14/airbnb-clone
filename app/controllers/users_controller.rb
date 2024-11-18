class UsersController < ApplicationController
  def dashboard
    @pending_bookings = Booking.where(user_id: current_user.id, status: false)
    @approved_bookings = Booking.where(user_id: current_user.id, status: true)
    @games = Game.where(user_id: current_user.id)
    @requests = Booking.joins(:game).where(games: { user_id: current_user.id }, status: false)
  end
end
