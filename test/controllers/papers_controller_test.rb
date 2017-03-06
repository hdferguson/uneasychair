require 'test_helper'

class PapersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get papers_index_url
    assert_response :success
  end

  test "should get new" do
    get papers_new_url
    assert_response :success
  end

  test "should get create" do
    get papers_create_url
    assert_response :success
  end

  test "should get destroy" do
    get papers_destroy_url
    assert_response :success
  end

end
