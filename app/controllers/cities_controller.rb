class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def show
    if params[:id].nil?
      @city = City.find(params[:id])
      render :show
    else
      search_cities
    end
  end

  def search_cities
    found = City.find(params[:id])
    if found.nil?
      redirect_to cities_path
    else
      @city = found
      render :show
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update(city_params)
      flash[:success] = "You updated #{@city.name}, #{@city.state}"
      redirect_to city_path(@city)
    else
      render :edit
    end
  end

  def create
    found = City.find_by(name: city_params["name"])
    if found.nil?
      @city = City.create(city_params)
      redirect_to city_path(@city)
    else
      redirect_to new_city_path
    end
  end

  def destroy
    city = City.find(params[:id])
    city = city.destroy
    flash[:success] = "#{city.name}, #{city.state} was successfully deleted!"
    redirect_to cities_path
  end

  private

  def city_params
    params.require(:city).permit(:name,:state)
  end

end
