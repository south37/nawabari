# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.connection.execute("delete from sqlite_sequence where name='users'")
User.create([
  { foursq_id: 1, name: 'baribari', area: 2.0 },
  { foursq_id: 2, name: 'wat', area: 3.0 },
  { foursq_id: 3, name: 'www', area: 3.0 },
  { foursq_id: 4, name: 'aaa', area: 3.0 }
])
user = User.create(foursq_id: 5, name: 'nyama', area: 88888)

Territory.create(lat: 35.663, lng: 139.695, name: '渋谷', venue_id: 2, been_here: 2, user: user)
