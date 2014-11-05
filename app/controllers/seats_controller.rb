class SeatsController < ApplicationController
  # GET /seats
  # GET /seats.json
  def index
    @seats = Seat.all

    render json: @seats
  end

  # GET /seats/1
  # GET /seats/1.json
  def show
    @seat = Seat.find(params[:id])

    render json: @seat
  end

  # POST /seats
  # POST /seats.json
  def create
    @seat = Seat.new(seat_params)

    if @seat.save
      render json: @seat, status: :created, location: @seat
    else
      render json: @seat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seats/1
  # PATCH/PUT /seats/1.json
  def update
    @seat = Seat.find(params[:id])

    if @seat.update(seat_params)
      head :no_content
    else
      render json: @seat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /seats/1
  # DELETE /seats/1.json
  def destroy
    @seat = Seat.find(params[:id])
    @seat.destroy

    head :no_content
  end

  private
    
    def seat_params
      params.require(:seat).permit(:name)
    end
end
