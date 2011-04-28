class TripsController < ApplicationController
  before_filter :load_trip, :except => [:new, :index, :create]
  respond_to :html, :xml, :json

  def index
    respond_with(@trips = Trip.all)
  end

  def show
  end

  def new
    @hotels = Hotel.order(:name)
    respond_with(@trip = Trip.new)
  end

  def create
    @trip = Trip.new(params[:trip])
    if @trip.save
      flash[:notice] = "Trip was created successfully"
      respond_with(@trip) do |format|
        format.html { redirect_to @trip }
      end
    else
      flash[:error] = @trip.errors.full_messages.join("\n<br />")
      @hotels = Hotel.order(:name)
      respond_with(@trip.errors) do |format|
        format.html { render :action => :new }
      end
    end
  end

  protected

  def load_trip
    @trip = Trip.find(params[:id])
  end
end
