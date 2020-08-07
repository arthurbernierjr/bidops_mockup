class CategoryItemLedgersController < ApplicationController
  before_action :set_category_item_ledger, only: [:show, :update, :destroy]

  # GET /category_item_ledgers
  def index
    @category_item_ledgers = CategoryItemLedger.all

    render json: @category_item_ledgers
  end

  # GET /category_item_ledgers/1
  def show
    render json: @category_item_ledger
  end

  # POST /category_item_ledgers
  def create
    @category_item_ledger = CategoryItemLedger.new(category_item_ledger_params)

    if @category_item_ledger.save
      render json: @category_item_ledger, status: :created, location: @category_item_ledger
    else
      render json: @category_item_ledger.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /category_item_ledgers/1
  def update
    if @category_item_ledger.update(category_item_ledger_params)
      render json: @category_item_ledger
    else
      render json: @category_item_ledger.errors, status: :unprocessable_entity
    end
  end

  # DELETE /category_item_ledgers/1
  def destroy
    @category_item_ledger.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_item_ledger
      @category_item_ledger = CategoryItemLedger.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_item_ledger_params
      params.require(:category_item_ledger).permit(:category_id, :item_id)
    end
end
