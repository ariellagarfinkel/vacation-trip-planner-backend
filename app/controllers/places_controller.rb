class PlacesController < ApplicationController
  before_action :authenticate_user, except: [:index]

  # def index
  #   @places = Place.all
  #   render json: @places
  # end

  def create
    trip = Trip.find_by(id: params[:trip_id])
    if current_user.id == trip.user.id
      @place = Place.create(
        trip_id: params[:trip_id],
        address: params[:address],
        name: params[:name],
        description: params[:description],
        image_url: params[:image_url],
        start_time: params[:start_time],
        end_time: params[:end_time],
      )
      if @place.save
        render json: @place
      else
        render json: { errors: @place.errors.full_messages }, status: :bad_request
      end
    else
      render json: {}, status: :unauthorized
    end
  end
end
