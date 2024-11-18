class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @games = Game.all
    if params[:query].present?
      @games = Game.search(params[:query])
    end
    @markers = @games.geocoded.map do |game|
      {
        lat: game.latitude,
        lng: game.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {game: game}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @game = Game.find(params[:id])
    @booking = Booking.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(games_params)
    @game.user = current_user
    if @game.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])
    if @game.destroy
      redirect_to dashboard_path
    end
  end

  private

  def games_params
    params.require(:game).permit(:name, :genre, :device, :num_players, :pickup_adress, :price)
  end
end
