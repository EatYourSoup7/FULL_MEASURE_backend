class Api::MarkersController < ApplicationController

  def index
    @markers = Marker.all
    render "index.json.jb"
  end

  def create
    @marker = Marker.new(
      user_id: 1,
      address: params[:address],
      zip_code: params[:zip_code],
      description: params[:description],
      status: params[:status]
      )
    @marker.save
    render "show.json.jb"
  end

  def show
    @marker = Marker.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @marker = Marker.find_by(id: params[:id])
    @marker.user_id = params[:user_id] || @marker.user_id
    @marker.address = params[:address] || @marker.address
    @marker.zip_code = params[:zip_code] || @marker.zip_code
    @marker.description = params[:description] || @marker.description
    @marker.status = params[:status] || @marker.status
    @marker.save
    render "show.json.jb"
  end

  def destroy
    marker = Marker.find_by(id: params[:id])
    marker.destroy
    render json: {message: "Marker successfully destroyed"}
  end
end
