class AirplanesController < ApplicationController
  before_action :set_airplane,only: [:show,:update,:destroy]

  # GET /airplanes
  def index
    @airplanes = Airplane.all
    json_response(@airplanes)
  end

  #POST /airplanes
  def create
    @airplane = Airplane.create!(airplane_params)
    json_response(@airplane, :created)
  end

  #GET /airplanes/:id
  def show
    json_response(@airplane)
  end

  #PUT /airplanes/:id
  def update
    @airplane.update(airplane_params)
    head :no_content
  end

  # DELETE /airplanes/:id
  def destroy
    @airplane.destroy
    head :no_content
  end

  private

  def airplane_params
    # whitelist params
    params.permit(:specificID, :name)
  end

  def set_airplane
    @airplane = Airplane.find(params[:id])
  end

end
