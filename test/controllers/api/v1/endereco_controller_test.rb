require 'test_helper'

class Api::V1::EnderecoControllerTest < ActionDispatch::IntegrationTest
  test "index deve retornar sucesso" do
    get :index    
    assert_response :success
  end
end
