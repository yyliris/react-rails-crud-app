# frozen_string_literal: true

json = ActiveSupport::JSON.decode(File.read('db/seeds/events.json'))
json.each do |record|
  Event.create!(record)
end

userjson = ActiveSupport::JSON.decode(File.read('db/seeds/users.json'))
userjson.each do |record|
  User.create!(record)
end