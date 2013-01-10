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
    "Reisen"
  ],[
    "Events"
  ],[
    "Sport"
  ]
]

category_list.each do |category|
  Category.create( :name => category[0])
end

# ARCHIVS

archiv_list = [
  [ 
    "Deutschland bereisen", 
    "Reisen",
    "Mache ein Bild das dich in Deutschland zeigt",
    "www.Deutschland.de",
    10
  ],[
    "Griechenland bereisen", 
    "Reisen",
    "Mache ein Bild das dich in Griechenland zeigt",
    "www.Griechenland.de",
    25
  ],[
    "Neuseeland bereisen", 
    "Reisen",
    "Mache ein Bild das dich in Neuseeland zeigt",
    "www.Neuseeland.de",
    80
  ],[
    "Amerika bereisen", 
    "Reisen",
    "Mache ein Bild das dich in Amerika zeigt",
    "www.Amerika.de",
    40
  ],[
    "Frankreich bereisen", 
    "Reisen",
    "Mache ein Bild das dich in Frankreich zeigt",
    "www.Frankreich.de",
    20
  ],[
    "Luxenburg bereisen", 
    "Reisen",
    "Mache ein Bild das dich in Luxenburg zeigt",
    "www.Luxenburg.de",
    20
  ],[

    "Menschenmasse 2000", 
    "Events",
    "Mach ein Bild mit mehr als 2000 Menschen",
    "www.events.de",
    20
  ],[
    "Menschenmasse 5000", 
    "Events",
    "Mach ein Bild mit mehr als 5000 Menschen",
    "www.events.de",
    40
  ],[
    "Menschenmasse 20000", 
    "Events",
    "Mach ein Bild mit mehr als 20000 Menschen",
    "www.events.de",
    60
  ],[
    "Menschenmasse 50000", 
    "Events",
    "Mach ein Bild mit mehr als 50000 Menschen",
    "www.events.de",
    100
  ],[

    "1 Bundesliga", 
    "Sport",
    "Mach ein Bild von einem Spiel der 1sten Bundesliga aus einem Stadion",
    "www.sport.de",
    50
  ],[
    "2 Bundesliga", 
    "Sport",
    "Mach ein Bild von einem Spiel der 2tn Bundesliga aus einem Stadion",
    "www.sport.de",
    25
  ]
]

archiv_list.each do |archiv|
  Archiv.create( :name => archiv[0], :category => archiv[1], :terms => archiv[2], :example_link => archiv[3], :points => archiv[4])
end