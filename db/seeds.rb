# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bar_1 = Bar.create(bar_name: "Ä",rating: "4", address:"Neukölnstrasse 12, 1232 Berlin", price:"$$$", picture_url:"https://www.cremeguides.com/wp-content/uploads/2017/03/thelonius-bar-berlin-kreuzberg-2.1489469627.jpg", category:"Bar")
bar_3 = Bar.create(bar_name: "Muted Horn",rating: "4.2", address:"Flughafenstr 49, 12053 Berlin", price:"$$", picture_url:"https://www.cremeguides.com/wp-content/uploads/2017/03/thelonius-bar-berlin-kreuzberg-2.1489469627.jpg", category:"Bar")
bar_4 = Bar.create(bar_name: "Brinks",rating: "3", address:"Hasenheide 117, 10967 Berlin", price:"$$", picture_url:"https://www.cremeguides.com/wp-content/uploads/2017/03/thelonius-bar-berlin-kreuzberg-2.1489469627.jpg", category:"Bar")
bar_5 = Bar.create(bar_name: "Ludwig",rating: "2.3", address:"Anzengruberstr. 3, 12043 Berlin", price:"$", picture_url:"https://www.cremeguides.com/wp-content/uploads/2017/03/thelonius-bar-berlin-kreuzberg-2.1489469627.jpg", category:"Bar")
bar_6 = Bar.create(bar_name: "Sandmann",rating: "5", address:"Reuterstr 7, 12053 Berlin", price:"$$$", picture_url:"https://www.cremeguides.com/wp-content/uploads/2017/03/thelonius-bar-berlin-kreuzberg-2.1489469627.jpg", category:"Bar")
bar_7 = Bar.create(bar_name: "Frollein Lagner",rating: "5", address:"Weisestr 34, 12049 Berlin", price:"$$$", picture_url:"https://www.cremeguides.com/wp-content/uploads/2017/03/thelonius-bar-berlin-kreuzberg-2.1489469627.jpg", category:"Bar")
bar_8 = Bar.create(bar_name: "Thelonious Bar",rating: "2", address:"Weserstrasse 202, 12047 Berlin", price:"$", picture_url:"https://www.cremeguides.com/wp-content/uploads/2017/03/thelonius-bar-berlin-kreuzberg-2.1489469627.jpg", category:"Bar")
bar_9 = Bar.create(bar_name: "Klunkerkranich",rating: "1.5", address:"Karl-Marx-Str 62, 12043 Berlin", price:"$$", picture_url:"https://www.cremeguides.com/wp-content/uploads/2017/03/thelonius-bar-berlin-kreuzberg-2.1489469627.jpg", category:"Bar")
bar_10 = Bar.create(bar_name: "Schwelgerei",rating: "5", address:"Flughafenstr. 49, 12053 Berlin", price:"$$", picture_url:"https://www.cremeguides.com/wp-content/uploads/2017/03/thelonius-bar-berlin-kreuzberg-2.1489469627.jpg", category:"Bar")


group_1 = Group.create(name:"Guys want fun",token:"")
group_4 = Group.create(name:"The champions",token:"")


