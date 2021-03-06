require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @micropost = microposts(:fruit)
  end

  test "redirect create when not logged in" do
    assert_no_difference ' Micropost.count' do
      post microposts_path, params: { micropost: { content: "I just a simple fruit" } }
    end
    assert_redirected_to login_url
  end

  test "redirect destroy when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end

  test "redirect destroy wrong microposts" do
    log_in_as(users(:one))
    micropost = microposts(:test1)
    assert_no_difference 'Micropost.count' do
      delete micropost_path(micropost)
    end
    assert_redirected_to root_url
  end

end
