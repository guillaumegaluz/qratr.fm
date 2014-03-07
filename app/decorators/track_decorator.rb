class TrackDecorator < Decorator::Base
  DEFAULT_TRACK_ARTWORK_URL = "http://www.whosampled.com/static/track_images_100/mr8231_201031_132914965488.jpg"
  MIX_MINIMUM_TIME = 20 * 60 * 1000 # 1_200_000

  def artwork_url
    model.artwork_url ? model.artwork_url : DEFAULT_TRACK_ARTWORK_URL
  end

  def mix?
    return false  unless model.duration
    model.duration > MIX_MINIMUM_TIME
  end
end
