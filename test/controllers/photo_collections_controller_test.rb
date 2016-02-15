require 'test_helper'

class PhotoCollectionsControllerTest < ActionController::TestCase
  setup do
    @photo_collection = photo_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_collections)
  end

  test "should create photo_collection" do
    assert_difference('PhotoCollection.count') do
      post :create, photo_collection: { end_date: @photo_collection.end_date, start_date: @photo_collection.start_date, tag: @photo_collection.tag }
    end

    assert_response 201
  end

  test "should show photo_collection" do
    get :show, id: @photo_collection
    assert_response :success
  end

  test "should update photo_collection" do
    put :update, id: @photo_collection, photo_collection: { end_date: @photo_collection.end_date, start_date: @photo_collection.start_date, tag: @photo_collection.tag }
    assert_response 204
  end

  test "should destroy photo_collection" do
    assert_difference('PhotoCollection.count', -1) do
      delete :destroy, id: @photo_collection
    end

    assert_response 204
  end
end
