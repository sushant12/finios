class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :update, :destroy]

  # GET /flights
  def index
    build_search_params
    @flights = Flight.ransack(params[:q]).result
    render json: FlightsSerializer.new(@flights)
  end

  # GET /flights/1
  def show
    render json: @flight
  end

  # POST /flights
  def create
    @flight = Flight.new(flight_params)

    if @flight.save
      render json: @flight, status: :created, location: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flights/1
  def update
    if @flight.update(flight_params)
      render json: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # DELETE /flights/1
  def destroy
    @flight.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flight_params
      params.fetch(:flight, {})
    end

    def build_search_params
      params[:q] = search_params
    end

    def search_params
      {
        from_eq: params[:from],
        to_eq: params[:to],
        date_eq: params[:date]
      }
    end
end
