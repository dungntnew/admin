require 'test_helper'

module Admin
  class DebuggerControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end

  end
end
