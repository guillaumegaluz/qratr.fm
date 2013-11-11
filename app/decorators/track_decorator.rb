class TrackDecorator < Draper::Decorator
  delegate_all

  DEFAULT_TRACK_ARTWORK_URL = "http://www.whosampled.com/static/track_images_100/mr8231_201031_132914965488.jpg"

  def artwork_url
    object.artwork_url ? object.artwork_url : DEFAULT_TRACK_ARTWORK_URL
  end

end
