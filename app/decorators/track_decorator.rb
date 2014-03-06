class TrackDecorator < Decorator::Base
  DEFAULT_TRACK_ARTWORK_URL = "http://www.whosampled.com/static/track_images_100/mr8231_201031_132914965488.jpg"
  MIX_MINIMUM_TIME = 20 * 60 * 1000 # 1_200_000

  def artwork_url
    model.artwork_url ? model.artwork_url : DEFAULT_TRACK_ARTWORK_URL
  end

  def duration_minutes
    return nil  unless model.duration
    duration_in_seconds = model.duration / 1000
    nb_minutes = duration_in_seconds / 60
    nb_seconds = (duration_in_seconds % 60).floor
    nb_seconds < 10 ? (return "#{nb_minutes}:0#{nb_seconds}") : (return "#{nb_minutes}:#{nb_seconds}")
  end

  def mix?
    return false  unless model.duration
    model.duration > MIX_MINIMUM_TIME
  end
end
