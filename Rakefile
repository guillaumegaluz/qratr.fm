# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

QratrRails::Application.load_tasks

task 'db:import' do
  sh "env DATABASE_URL=postgres://localhost/qratr_rails_development heroku pg:transfer --confirm qratr"
end

task 'guard' do
  sh "bundle exec guard"
end

# Create an individual track
# url = "https://soundcloud.com/break-sl/c-beams-panorama-bar-pt-2"
# track = TrackCreator.new(url).build
# track.update_attribute(:playlist_id, Playlist.last.id)
