class FlatsController < ApplicationController
  def index
    if params[:query].present?
      @flats = Flat.where("name LIKE ?", "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to @flat, notice: 'Flat was successfully created.'
    else
      render :new
    end

    def show
      @flat = Flat.find(params[:id])
    end

    def edit
      @flat = Flat.find(params[:id])
    end

    def update
      @flat = Flat.find(params[:id])
      if @flat.update(flat_params)
        redirect_to @flat, notice: 'Flat was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @flat = Flat.find(params[:id])
      @flat.destroy
      redirect_to flats_path, notice: 'Flat was successfully deleted.'
    end


  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end
end
