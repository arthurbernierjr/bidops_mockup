require 'test_helper'

class ItemDataPropertyLedgersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_data_property_ledger = item_data_property_ledgers(:one)
  end

  test "should get index" do
    get item_data_property_ledgers_url, as: :json
    assert_response :success
  end

  test "should create item_data_property_ledger" do
    assert_difference('ItemDataPropertyLedger.count') do
      post item_data_property_ledgers_url, params: { item_data_property_ledger: { data: @item_data_property_ledger.data, data_property_references: @item_data_property_ledger.data_property_references, item_id: @item_data_property_ledger.item_id } }, as: :json
    end

    assert_response 201
  end

  test "should show item_data_property_ledger" do
    get item_data_property_ledger_url(@item_data_property_ledger), as: :json
    assert_response :success
  end

  test "should update item_data_property_ledger" do
    patch item_data_property_ledger_url(@item_data_property_ledger), params: { item_data_property_ledger: { data: @item_data_property_ledger.data, data_property_references: @item_data_property_ledger.data_property_references, item_id: @item_data_property_ledger.item_id } }, as: :json
    assert_response 200
  end

  test "should destroy item_data_property_ledger" do
    assert_difference('ItemDataPropertyLedger.count', -1) do
      delete item_data_property_ledger_url(@item_data_property_ledger), as: :json
    end

    assert_response 204
  end
end
