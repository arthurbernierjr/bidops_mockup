class ItemDataPropertyLedgersController < ApplicationController
  before_action :set_item_data_property_ledger, only: [:show, :update, :destroy]

  # GET /item_data_property_ledgers
  def index
    @item_data_property_ledgers = ItemDataPropertyLedger.all

    render json: @item_data_property_ledgers.to_json(include: [:item, :data_property])
  end

  # GET /item_data_property_ledgers/1
  def show
    render json: @item_data_property_ledger.to_json(include: [:item, :data_property])
  end

  # POST /item_data_property_ledgers
  def create
    @item_data_property_ledger = ItemDataPropertyLedger.new(item_data_property_ledger_params)

    if @item_data_property_ledger.save
      render json: @item_data_property_ledger, status: :created, location: @item_data_property_ledger
    else
      render json: @item_data_property_ledger.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_data_property_ledgers/1
  def update
    if @item_data_property_ledger.update(item_data_property_ledger_params)
      render json: @item_data_property_ledger
    else
      render json: @item_data_property_ledger.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_data_property_ledgers/1
  def destroy
    @item_data_property_ledger.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_data_property_ledger
      @item_data_property_ledger = ItemDataPropertyLedger.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_data_property_ledger_params
      params.require(:item_data_property_ledger).permit(:item_id, :data_property_id, :data)
    end
end
