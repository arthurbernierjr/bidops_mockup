class DataAttributesController < ApplicationController
  before_action :set_attribute, only: [:show, :update, :destroy]

  # GET /data_attributes
  def index
    @data_attributes = DataAttribute.all

    @data_attribute_names = []
    @data_attributes.each { |item| @data_attribute_names.push({name: item.name, id: item.id}) }
    render json: @data_attribute_names
  end

  # GET /data_attributes/1
  def show
    render json: @data_attribute
  end

  # POST /data_attributes
  def create
    @data_attribute = DataAttribute.new(attribute_params)

    if @data_attribute.save
      render json: @data_attribute, status: :created, location: @data_attribute
    else
      render json: @data_attribute.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /data_attributes/1
  def update
    if @data_attribute.update(attribute_params)
      render json: @data_attribute
    else
      render json: @data_attribute.errors, status: :unprocessable_entity
    end
  end

  # DELETE /data_attributes/1
  def destroy
    @data_attribute.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute
      @data_attribute = DataAttribute.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attribute_params
      params.require(:data_attribute).permit(:name)
    end
end
