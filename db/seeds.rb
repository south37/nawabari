# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create([
  { foursq_id: 1, name: 'baribari', area: 20000.0 },
  { foursq_id: 2, name: 'wat', area: 10000.0 },
  { foursq_id: 3, name: 'www', area: 14000.0 },
  { foursq_id: 4, name: 'aaa', area: 27000.0 }
])
user = User.create(foursq_id: 5, name: 'ooo', area: 1406720)

Territory.delete_all
Territory.create([
  { lat: 35.658508, lng: 139.701325, name: 'JR 渋谷駅', venue_id: '4b6c0307f964a5208c1f2ce3', been_here: 20, user: user },
  { lat: 35.66, lng: 139.701325, name: '渋谷', venue_id: '4b6c0307f964a5208c1f2ce3', been_here: 20, user: user },
  { lat: 35.663, lng: 139.701325, name: '渋谷', venue_id: '4b6c0307f964a5208c1f2ce3', been_here: 100, user: user },
  { lat: 35.665, lng: 139.701325, name: '渋谷', venue_id: '4b6c0307f964a5208c1f2ce3', been_here: 20, user: user },
  { lat: 35.67, lng: 140.0, name: '渋谷', venue_id: '4b6c0307f964a5208c1f2ce3', been_here: 20, user: user },
  { lat: 35.68, lng: 139.7013250, name: '渋谷', venue_id: '4b6c0307f964a5208c1f2ce3', been_here: 20, user: user },
  { lat: 35.659, lng: 139.705, name: '渋谷', venue_id: 'ss', been_here: 20, user: user },
  { lat: 35.66, lng: 139.71, name: '渋谷', venue_id: 'ss', been_here: 20, user: user },
  { lat: 35.663, lng: 139.711, name: '渋谷2', venue_id: 'sss', been_here: 20, user:user },
  { lat: 35.6635, lng: 139.714, name: '渋谷3', venue_id: 'sss', been_here: 20, user:user }
])

