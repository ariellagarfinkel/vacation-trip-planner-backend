class TripsController < ApplicationController
  def index
    @trips = Trip.all
    render json: @trips
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    render json: @trip
  end

  def create
    @trip = Trip.create(
      user_id: params[:user_id],
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
    @trip = Trip.find_by(id: params[:id])
    @trip.update(
      title: params[:title] || @trip.title,
      image_url: params[:image_url] || @trip.image_url,
      start_time: params[:start_time] || @trip.start_time,
      end_time: params[:end_time] || @trip.end_time,
    )
    render json: @trip
  end
end
