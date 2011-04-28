class RestaurantsController < ApplicationController
  respond_to :html, :json

  def index
    respond_with(@restaurants = Restaurant.order(:name))
  end

  def new
    @cities = City.order(:name)
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])
    if @restaurant.save
      flash[:notice] = "Restaurant was created successfully."
      respond_with(@restaurant) do |format|
        format.html { redirect_to @restaurant }
      end
    else
      flash[:error] = @restaurant.errors.full_messages.join("\n")
      @cities = City.order(:name)
      respond_with(@restaurant.errors) do |format|
        format.html { render :action => :new }
      end
    end
  end
end
