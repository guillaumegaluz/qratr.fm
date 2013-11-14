# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require './db/seeds'

QratrRails::Application.load_tasks

task 'db:seed' do
  Seeds.generate_data
end

# Create an individual track
# url = "https://soundcloud.com/timsweeney/djharvey?in=timsweeney/sets/bis703"
# track = TrackCreator.new(url).build
# track.update_attribute(:playlist_id, 7)

