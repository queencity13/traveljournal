class HotelsController < ApplicationController
  before_filter :load_hotel, :except => [:new, :index, :create]
  respond_to :html, :xml, :json

  def index
    respond_with(@hotels = Hotel.order(:name))
  end

  def show
  end

  def new
    @cities = City.order(:name)
    respond_with(@hotel = Hotel.new)
  end

  def create
    @hotel = Hotel.new(params[:hotel])
    if @hotel.save
      flash[:notice] = "Hotel was created successfully."
      respond_with(@hotel) do |format|
        format.html { redirect_to @hotel }
        format.js
      end
    else
      flash[:error] = @hotel.errors.full_messages.join("\n")
      @cities = City.order('name')
      respond_with(@hotel.errors, :status => :unprocessable_entity) do |format|
        format.html { render :action => :new }
        format.js
      end
    end
  end

  def destroy
    @hotel.destroy

    respond_with do |format|
      format.html { redirect_to(hotels_url) }
      format.js { render :nothing => true }
    end
  end

  protected

  def load_hotel
    @hotel = Hotel.find(params[:id])
  end
end
