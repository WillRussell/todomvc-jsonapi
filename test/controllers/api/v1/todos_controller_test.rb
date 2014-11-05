require 'test_helper'

class Api::V1::TodosControllerTest < ActionController::TestCase

  context "Get todos#index" do
    setup { get :index }
    
    should respond_with(:ok)
   end
end


