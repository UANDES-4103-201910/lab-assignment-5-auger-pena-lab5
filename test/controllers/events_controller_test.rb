require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get [create" do
    get events_[create_url
    assert_response :success
  end

  test "should get destroy" do
    get events_destroy_url
    assert_response :success
  end

  test "should get update]" do
    get events_update]_url
    assert_response :success
  end

end
