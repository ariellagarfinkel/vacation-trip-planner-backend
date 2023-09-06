class TripsController < ApplicationController
  before_action :authenticate_user

  def index
    @trips = current_user.trips.all
    render json: @trips
  end

  def show
    if @trip = current_user.trips.find_by(id: params[:id])
      render json: @trip
    else
      render json: { message: "Don't look at other peoples trips!!" }, status: :unprocessable_entity
    end
  end

  def create
    @trip = Trip.create(
      user_id: current_user.id,
      title: params[:title],
      image_url: params[:image_url],
      start_time: params[:start_time],
      end_time: params[:end_time],
    )
    if @trip.save
      render json: @trip
    else render json: { errors: @trip.errors.full_messages }, status: :bad_request     end
  end

  def update
    @trip = current_user.trips.find_by(id: params[:id])
    @trip.update(
      title: params[:title] || @trip.title,
      image_url: params[:image_url] || @trip.image_url,
      start_time: params[:start_time] || @trip.start_time,
      end_time: params[:end_time] || @trip.end_time,
    )
    render json: @trip
  end
end
