class DataPropertiesController < ApplicationController
  before_action :set_data_property, only: [:show, :update, :destroy]

  # GET /data_properties
  def index
    @data_properties = DataProperty.all

    @data_property_names = []
    @data_properties.each { |item| @data_property_names.push({name: item.name, id: item.id}) }
    render json: @data_property_names
  end

  # GET /data_properties/1
  def show
    render json: @data_property
  end

  # POST /data_properties
  def create
    @data_property = DataProperty.new(data_property_params)

    if @data_property.save
      render json: @data_property, status: :created, location: @data_property
    else
      render json: @data_property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /data_properties/1
  def update
    if @data_property.update(data_property_params)
      render json: @data_property
    else
      render json: @data_property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /data_properties/1
  def destroy
    @data_property.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_property
      @data_property = DataProperty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def data_property_params
      params.require(:data_property).permit(:name)
    end
end
