require 'test_helper'

class CategoryItemLedgersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_item_ledger = category_item_ledgers(:one)
  end

  test "should get index" do
    get category_item_ledgers_url, as: :json
    assert_response :success
  end

  test "should create category_item_ledger" do
    assert_difference('CategoryItemLedger.count') do
      post category_item_ledgers_url, params: { category_item_ledger: { category_id: @category_item_ledger.category_id, item_id: @category_item_ledger.item_id } }, as: :json
    end

    assert_response 201
  end

  test "should show category_item_ledger" do
    get category_item_ledger_url(@category_item_ledger), as: :json
    assert_response :success
  end

  test "should update category_item_ledger" do
    patch category_item_ledger_url(@category_item_ledger), params: { category_item_ledger: { category_id: @category_item_ledger.category_id, item_id: @category_item_ledger.item_id } }, as: :json
    assert_response 200
  end

  test "should destroy category_item_ledger" do
    assert_difference('CategoryItemLedger.count', -1) do
      delete category_item_ledger_url(@category_item_ledger), as: :json
    end

    assert_response 204
  end
end
