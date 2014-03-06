class PlaylistDecorator < Decorator::Base
  def total_duration
    model.tracks.inject(0) { |sum,track| sum = sum + track.duration }
  end
end
