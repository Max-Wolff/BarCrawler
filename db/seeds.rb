# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Stop.destroy_all
Bar.destroy_all
Group.destroy_all
Drink.destroy_all

bar_1 = Bar.create(name: "Ä",rating: 4, address:"Neukölnstrasse 12, 1232 Berlin", price:3, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Until 1:00 AM", open_today: false, latitude: 52.507859, longitude: 13.391951)
bar_3 = Bar.create(name: "Muted Horn",rating: 4.2, address:"Flughafenstr 49, 12053 Berlin", price:2, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Until 12:00 PM", open_today: true, latitude: 52.5079, longitude: 13.339951)
bar_4 = Bar.create(name: "Brinks",rating: 3, address:"Hasenheide 117, 10967 Berlin", price:2, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Until 1:00 AM", open_today: true, latitude: 52.54, longitude: 13.34151)
bar_5 = Bar.create(name: "Ludwig",rating: 2.3, address:"Anzengruberstr. 3, 12043 Berlin", price:1, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Until 1:00 AM", open_today: true, latitude: 52.559, longitude: 13.36951)
bar_6 = Bar.create(name: "Sandmann",rating: 5, address:"Reuterstr 7, 12053 Berlin", price:3, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Until 1:00 AM", open_today: true, latitude: 52.5, longitude: 13.3551)
bar_7 = Bar.create(name: "Frollein Lagner",rating: 5, address:"Weisestr 34, 12049 Berlin", price:3, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Until 1:00 AM", open_today: true, latitude: 52.50859, longitude: 13.34951)
bar_8 = Bar.create(name: "Thelonious Bar",rating: 2, address:"Weserstrasse 202, 12047 Berlin", price:1, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Until 1:00 AM", open_today: true, latitude: 52.547859, longitude: 13.315)
bar_9 = Bar.create(name: "Klunkerkranich",rating: 1.5, address:"Karl-Marx-Str 62, 12043 Berlin", price:2, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Until 1:00 AM", open_today: true, latitude: 52.50, longitude: 13.39)
bar_10 = Bar.create(name: "Schwelgerei",rating: 5, address:"Flughafenstr. 49, 12053 Berlin", price:2, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Until 1:00 AM", open_today: true, latitude: 52.507859, longitude: 13.391951)

group_1 = Group.create(name:"Guys just want to have fun",token:"")
group_4 = Group.create(name:"The champions",token:"")

Drink.create(name: 'Beer', picture_url: 'https://kattus.at/wp-content/uploads/corona-extra.jpg')
Drink.create(name: 'Tequila', picture_url: 'https://image.freepik.com/free-photo/gold-tequila-shot-with-lime-isolated-white_80510-533.jpg')
Drink.create(name: 'Berliner Luft', picture_url: 'https://aniland-shop.de/media/image/02/1c/4e/Produkte_Berliner_Luft_SuperStrong_070-l_600x600.jpg')
Drink.create(name: 'Jägermeister', picture_url: 'https://media-verticommnetwork1.netdna-ssl.com/wines/jagermeister-100ml-1505747-s515.jpg')
Drink.create(name: 'Vodka', picture_url: 'https://cdn.heinemann-shop.com/images/h29/h72/9338414989342.jpg')
Drink.create(name: 'Pina Colada', picture_url: 'https://cdn.webshopapp.com/shops/72785/files/147355199/flavor-west-pina-colada.jpg')

