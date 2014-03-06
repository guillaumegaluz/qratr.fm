class PlaylistDecorator < Decorator::Base
  def total_duration
    model.tracks.inject(0) do |sum,track|
      track.duration.nil? ? sum : (sum = sum + track.duration)
    end
  end
end
