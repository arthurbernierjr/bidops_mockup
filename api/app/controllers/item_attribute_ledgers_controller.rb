class ItemAttributeLedgersController < ApplicationController
  before_action :set_item_attribute_ledger, only: [:show, :update, :destroy]

  # GET /item_attribute_ledgers
  def index
    @item_attribute_ledgers = ItemAttributeLedger.all

    render json: @item_attribute_ledgers.to_json(include: [:item, :data_attribute])
  end

  # GET /item_attribute_ledgers/1
  def show
    render json: @item_attribute_ledger.to_json(include: [:item, :data_attribute])
  end

  # POST /item_attribute_ledgers
  def create
    @item_attribute_ledger = ItemAttributeLedger.new(item_attribute_ledger_params)

    if @item_attribute_ledger.save
      render json: @item_attribute_ledger, status: :created, location: @item_attribute_ledger
    else
      render json: @item_attribute_ledger.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_attribute_ledgers/1
  def update
    if @item_attribute_ledger.update(item_attribute_ledger_params)
      render json: @item_attribute_ledger
    else
      render json: @item_attribute_ledger.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_attribute_ledgers/1
  def destroy
    @item_attribute_ledger.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_attribute_ledger
      @item_attribute_ledger = ItemAttributeLedger.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_attribute_ledger_params
      params.require(:item_attribute_ledger).permit(:item_id, :data_attribute_id, :data)
    end
end
