# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# CATEGORIES

category_list = [
  [ 
    "1v1"
  ],[
    "3v3"
  ],[
    "5v5"
  ]
]

category_list.each do |category|
  Category.create( :name => category[0])
end

# ARCHIVS

archiv_list = [
  [ 
    "Gewinne ein mirror match", 
    "1v1",
    "tbd",
    "tbd",
    10
  ],[
    "Erreiche mehr als 10 kills", 
    "1v1",
    "tbd",
    "tbd",
    25
  ],[
    "Gewinne als AP Champion gegen einen Tank", 
    "1v1",
    "tbd",
    "tbd",
    80
  ],[
    "Gewinne mit einem AD Carry", 
    "1v1",
    "tbd",
    "tbd",
    40
  ],[
    "Gewinne mit einem AD Support", 
    "1v1",
    "tbd",
    "tbd",
    200
  ],[
    "Gewinne ohne das du stirbst", 
    "1v1",
    "tbd",
    "tbd",
    20
  ],[

    "Gewinne ohne das jemand aus deinem Team stirbt", 
    "3v3",
    "tbd",
    "tbd",
    20
  ],[
    "Gewinne 3x in folge", 
    "3v3",
    "tbd",
    "tbd",
    40
  ],[
    "Gewinne 5x in folge", 
    "3v3",
    "tbd",
    "tbd",
    60
  ],[
    "Gewinne 10x in folge", 
    "3v3",
    "tbd",
    "tbd",
    100
  ],[

    "Gewinne 3x in folge", 
    "5v5",
    "tbd",
    "tbd",
    50
  ],[
    "Gewinne 5x in folge", 
    "5v5",
    "tbd",
    "tbd",
    25
  ]
]

archiv_list.each do |archiv|
  Archiv.create( :name => archiv[0], :category => archiv[1], :terms => archiv[2], :example_link => archiv[3], :points => archiv[4])
end