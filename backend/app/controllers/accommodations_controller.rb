class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :update, :destroy]

  # GET /accommodations
  def index
    @accommodations = Accommodation.includes(:type, :rating).select(index_fields + [:type_id, :rating_id])

    render json: @accommodations, :include => { :type=> { :only => :name } }, only: index_fields
  end

  # GET /accommodations/1
  def show
    render json: @accommodation, :include => { :type=> { :only => :name } }
  end

  # POST /accommodations
  def create
    @accommodation = Accommodation.new(accommodation_params)

    if @accommodation.save
      render json: @accommodation, status: :created, location: @accommodation
    else
      render json: @accommodation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accommodations/1
  def update
    if @accommodation.update(accommodation_params)
      render json: @accommodation
    else
      render json: @accommodation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accommodations/1
  def destroy
    @accommodation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accommodation
      @accommodation = Accommodation.includes(:type, :rating).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def accommodation_params
      params.require(:accommodation).permit(:title, :city, :country, :type_id, :floor_area, :bedrooms, :bathrooms, :min_stay_nights, :max_guests, :rating_id)
    end

    def index_fields
      [:id, :title, :city, :max_guests]
    end
end
