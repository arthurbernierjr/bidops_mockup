require 'test_helper'

class AttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_attribute = attributes(:one)
  end

  test "should get index" do
    get dataAttributes_url, as: :json
    assert_response :success
  end

  test "should create data_attribute" do
    assert_difference('DataAttribute.count') do
      post dataAttributes_url, params: {data_attribute: {name: @data_attribute.name } }, as: :json
    end

    assert_response 201
  end

  test "should show data_attribute" do
    get dataAttribute_url(@data_attribute), as: :json
    assert_response :success
  end

  test "should update data_attribute" do
    patch dataAttribute_url(@data_attribute), params: {data_attribute: {name: @data_attribute.name } }, as: :json
    assert_response 200
  end

  test "should destroy data_attribute" do
    assert_difference('DataAttribute.count', -1) do
      delete dataAttribute_url(@data_attribute), as: :json
    end

    assert_response 204
  end
end
