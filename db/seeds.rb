# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bar.destroy_all
Group.destroy_all

bar_1 = Bar.create(name: "Ä",rating: 4, address:"Neukölnstrasse 12, 1232 Berlin", price:3, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 1:00 AM", open_today: false, latitude: 52.507859, longitude: 13.391951)
bar_3 = Bar.create(name: "Muted Horn",rating: 4.2, address:"Flughafenstr 49, 12053 Berlin", price:2, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 12:00 PM", open_today: true, latitude: 52.5079, longitude: 13.139951)
bar_4 = Bar.create(name: "Brinks",rating: 3, address:"Hasenheide 117, 10967 Berlin", price:2, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 1:00 AM", open_today: true, latitude: 52.59, longitude: 13.39151)
bar_5 = Bar.create(name: "Ludwig",rating: 2.3, address:"Anzengruberstr. 3, 12043 Berlin", price:1, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 1:00 AM", open_today: true, latitude: 52.859, longitude: 13.291951)
bar_6 = Bar.create(name: "Sandmann",rating: 5, address:"Reuterstr 7, 12053 Berlin", price:3, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 1:00 AM", open_today: true, latitude: 52.9, longitude: 13.31951)
bar_7 = Bar.create(name: "Frollein Lagner",rating: 5, address:"Weisestr 34, 12049 Berlin", price:3, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 1:00 AM", open_today: true, latitude: 52.50859, longitude: 13.34951)
bar_8 = Bar.create(name: "Thelonious Bar",rating: 2, address:"Weserstrasse 202, 12047 Berlin", price:1, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 1:00 AM", open_today: true, latitude: 52.547859, longitude: 13.315)
bar_9 = Bar.create(name: "Klunkerkranich",rating: 1.5, address:"Karl-Marx-Str 62, 12043 Berlin", price:2, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 1:00 AM", open_today: true, latitude: 52.50, longitude: 13.39)
bar_10 = Bar.create(name: "Schwelgerei",rating: 5, address:"Flughafenstr. 49, 12053 Berlin", price:2, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 1:00 AM", open_today: true, latitude: 52.507859, longitude: 13.391951)

group_1 = Group.create(name:"Guys just want to have fun",token:"")
group_4 = Group.create(name:"The champions",token:"")


