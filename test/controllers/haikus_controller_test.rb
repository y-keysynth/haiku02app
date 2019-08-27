require 'test_helper'

class HaikusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get haikus_index_url
    assert_response :success
  end

  test "should get show" do
    get haikus_show_url
    assert_response :success
  end

  test "should get edit" do
    get haikus_edit_url
    assert_response :success
  end

  test "should get new" do
    get haikus_new_url
    assert_response :success
  end

end
