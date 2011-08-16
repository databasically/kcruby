require 'test_helper'

class PodcastTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Podcast.new.valid?
  end
end
