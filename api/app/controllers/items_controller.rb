class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]


  # get all data
  def allData
    @items = Item.all
    @categories = Category.all
    @data_properties = DataProperty.all
    @data_attributes = DataAttribute.all
    @category_names = []
    @categories.each { |item| @category_names.push({name: item.name, id: item.id}) }
    @data_attribute_names = []
    @data_attributes.each { |item| @data_attribute_names.push({name: item.name, id: item.id}) }
    @data_property_names = []
    @data_properties.each { |item| @data_property_names.push({name: item.name, id: item.id}) }

    @full_data = {
      items: @items,
      categories: @category_names,
      properties: @data_property_names,
      attributes: @data_attribute_names
    }
    render json: @full_data
  end
  # GET /items
  def index
    @items = Item.all

    render json: @items.to_json(include: [:item_data_property_ledgers, :item_attribute_ledgers, :categories])
  end

  # GET /items/1
  def show
    render json: @item.to_json(include: [:item_data_property_ledgers, :item_attribute_ledgers, :categories])
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    @item.name.squish!
    if @item.name == ''
      render json: {message: 'Added'}, status: :created
    end
    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name)
    end
end
