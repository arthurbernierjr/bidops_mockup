require 'test_helper'

class DataPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_property = data_properties(:one)
  end

  test "should get index" do
    get data_properties_url, as: :json
    assert_response :success
  end

  test "should create data_property" do
    assert_difference('DataProperty.count') do
      post data_properties_url, params: { data_property: { name: @data_property.name } }, as: :json
    end

    assert_response 201
  end

  test "should show data_property" do
    get data_property_url(@data_property), as: :json
    assert_response :success
  end

  test "should update data_property" do
    patch data_property_url(@data_property), params: { data_property: { name: @data_property.name } }, as: :json
    assert_response 200
  end

  test "should destroy data_property" do
    assert_difference('DataProperty.count', -1) do
      delete data_property_url(@data_property), as: :json
    end

    assert_response 204
  end
end
