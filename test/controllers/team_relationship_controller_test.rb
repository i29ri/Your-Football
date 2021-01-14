require 'test_helper'

class TeamRelationshipControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get team_relationship_create_url
    assert_response :success
  end

  test "should get destroy" do
    get team_relationship_destroy_url
    assert_response :success
  end

end
