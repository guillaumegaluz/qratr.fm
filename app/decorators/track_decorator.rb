class TrackDecorator < Draper::Decorator
  delegate_all

  DEFAULT_TRACK_ARTWORK_URL = "http://www.whosampled.com/static/track_images_100/mr8231_201031_132914965488.jpg"

  # -------------------------
  # Override track attributes
  # -------------------------

  def artwork_url
    object.artwork_url ? object.artwork_url : DEFAULT_TRACK_ARTWORK_URL
  end

  def duration
    duration_in_seconds = object.duration / 1000
    nb_minutes = duration_in_seconds / 60
    nb_seconds = (duration_in_seconds % 60).floor
    return "#{nb_minutes}:#{nb_seconds}"
  end
end
