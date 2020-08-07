require 'test_helper'

class ItemAttributeLedgersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_attribute_ledger = item_attribute_ledgers(:one)
  end

  test "should get index" do
    get item_attribute_ledgers_url, as: :json
    assert_response :success
  end

  test "should create item_attribute_ledger" do
    assert_difference('ItemAttributeLedger.count') do
      post item_attribute_ledgers_url, params: { item_attribute_ledger: { attribute_id: @item_attribute_ledger.attribute_id, data: @item_attribute_ledger.data, item_id: @item_attribute_ledger.item_id } }, as: :json
    end

    assert_response 201
  end

  test "should show item_attribute_ledger" do
    get item_attribute_ledger_url(@item_attribute_ledger), as: :json
    assert_response :success
  end

  test "should update item_attribute_ledger" do
    patch item_attribute_ledger_url(@item_attribute_ledger), params: { item_attribute_ledger: { attribute_id: @item_attribute_ledger.attribute_id, data: @item_attribute_ledger.data, item_id: @item_attribute_ledger.item_id } }, as: :json
    assert_response 200
  end

  test "should destroy item_attribute_ledger" do
    assert_difference('ItemAttributeLedger.count', -1) do
      delete item_attribute_ledger_url(@item_attribute_ledger), as: :json
    end

    assert_response 204
  end
end
