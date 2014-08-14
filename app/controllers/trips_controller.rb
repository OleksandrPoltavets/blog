class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      redirect_to trips_url, notice: 'Trip was created.'
    else
      render 'new'
    end
  end

  def index
    current_user.admin? ? @trips = Trip.all : @trips = Trip.where(user_id: current_user.id)

  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      flash[:success] = "Trip updated"
      redirect_to trips_url
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    trip = Trip.find(params[:id])
    if trip.user_id == current_user.id or current_user.admin?
      trip.destroy
      flash[:success] = "Trip \"#{trip.id}\" removed."
    else
      flash[:error] = "Cannot delete this trip!"
    end
    redirect_to trips_url
  end

  private

    def trip_params
      params.require(:trip).permit(:user_id, :city_from, :city_to, :mileage, :start, :finish, :fuel_avg, :fuel_price, :comments)
    end
end
