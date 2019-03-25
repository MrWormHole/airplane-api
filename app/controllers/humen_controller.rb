class HumenController < ApplicationController
  before_action :set_airplane
  before_action :set_human_inside_airplane, only: [:show, :update, :destroy]

  # GET /airplanes/:airplane_id/humen
  def index
    json_response(@airplane.humen)
  end

  # GET /airplanes/:airplane_id/humen/:id
  def show
    json_response(@human)
  end

  # POST /airplanes/:airplane_id/humen
  def create
    @airplane.humen.create!(human_params)
    json_response(@airplane, :created)
  end

  # PUT /airplanes/:airplane_id/humen/:id
  def update
    @human.update(human_params)
    head :no_content
  end

  # DELETE /airplanes/:airplane_id/humen/:id
  def destroy
    @human.destroy
    head :no_content
  end

  private

  def human_params
    params.permit(:name,:job)
  end

  def set_airplane
    @airplane = Airplane.find(params[:airplane_id])
  end

  def set_human_inside_airplane
    @human = @airplane.humen.find_by!(id: params[:id]) if @airplane
  end
end
