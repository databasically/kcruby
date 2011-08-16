require 'test_helper'

class PodcastsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Podcast.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Podcast.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Podcast.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to podcast_url(assigns(:podcast))
  end

  def test_edit
    get :edit, :id => Podcast.first
    assert_template 'edit'
  end

  def test_update_invalid
    Podcast.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Podcast.first
    assert_template 'edit'
  end

  def test_update_valid
    Podcast.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Podcast.first
    assert_redirected_to podcast_url(assigns(:podcast))
  end

  def test_destroy
    podcast = Podcast.first
    delete :destroy, :id => podcast
    assert_redirected_to podcasts_url
    assert !Podcast.exists?(podcast.id)
  end
end
