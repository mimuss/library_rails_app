require 'test_helper'

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get libraries_index_url
    assert_response :success
  end

end
