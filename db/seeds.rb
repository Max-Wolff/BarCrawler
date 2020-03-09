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

Drink.create(name: 'Beer', picture_url: 'https://www.stickpng.com/assets/images/580b57fbd9996e24bc43c099.png')
Drink.create(name: 'Tequila', picture_url: 'https://i.dlpng.com/static/png/5544536-tequila-png-abeoncliparts-cliparts-vectors-for-free-2019-tequila-shots-png-1200_1200_preview.png')
Drink.create(name: 'Berliner Luft', picture_url: 'https://www.konsum-leipzig.de/media/image/b9/7c/b2/DV019_4013228325202_VORvRXP9oGhXhcN0_600x600.png')
Drink.create(name: 'Jägermeister', picture_url: 'https://www.konsum-leipzig.de/media/image/4b/4c/4a/DV019_4067700011015_VORxaFVIK0yWdPT2.png')
Drink.create(name: 'Vodka', picture_url: 'https://www.konsum-leipzig.de/media/image/6e/f3/0a/DV019_7312040017683_VORBgtJOyFcjUX8v_600x600.png')
Drink.create(name: 'Pina Colada', picture_url: 'https://www.stickpng.com/assets/images/587e33c79686194a55adab85.png')
Drink.create(name: 'Water', picture_url: 'https://www.stickpng.com/assets/images/580b585b2edbce24c47b2780.png')
Drink.create(name: 'Whiskey', picture_url: 'https://image.jimcdn.com/app/cms/image/transf/none/path/s715df08dde25b0ce/image/i805a8319495bcfd4/version/1544103782/image.png')
Drink.create(name: 'Baileys', picture_url: 'https://www.baileys.com/images/home-element.png')
Drink.create(name: 'Gin Tonic', picture_url: 'https://cdn.shopify.com/s/files/1/1119/0054/articles/Cucumber_Gin_Summer_Cocktail_1024x.png?v=1519482729')
Drink.create(name: 'Moscow Mule', picture_url: 'https://www.proofcocktail.com/thumbs/240x220/files/zc/mule_14514.png')
Drink.create(name: 'Vodka Energy', picture_url: 'https://www.pngkey.com/png/full/50-507103_vodka-red-bull-bundle-vodka-red-bull-png.png')
Drink.create(name: 'White Wine', picture_url: 'https://pngimage.net/wp-content/uploads/2018/06/white-wine-glass-png-5.png')
Drink.create(name: 'Red Wine', picture_url: 'https://pngimage.net/wp-content/uploads/2018/06/glass-of-red-wine-png.png')
