# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

p "is detroying - #{Vehicle.all.count} vehicles - #{User.all.count} users - #{Booking.all.count}"
Booking.destroy_all
Vehicle.all.each do |vehicle|
  vehicle.photo.purge
end
Vehicle.destroy_all
User.destroy_all

p "destroyed- vehicles: #{Vehicle.all.count} - users:#{User.all.count}"
p "destroyed- bookings:#{Booking.all.count}"
p "number of vehicles"
p Vehicle.count
p "number of users"
p User.count
p "number of bookings"
p Booking.count

user = User.create!(email: 'john@example.com', password: 'password')
renter = User.create!(email: 'renter@example.com', password: 'password2')

fairy_wings = Vehicle.new(
  user: user,
	name: "Fairy's wings",
	vehicle_type: 'aerial',
	address: 'Istanbul',
	passengers_capacity: 1,
	price_per_day: 3700,
	cruising_speed: 40,
	fuel_type: 'magical',
	ecological_label: 'B',
	description: "Why walk with your tired legs when you can simply rent these fabulous wings from a magical fairy? They will be particularly convenient for a night in disguise or to go pick up your kids from school."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176462878790918144/bohemond8467_on_a_hanger_in_a_closet_two_translucid_wings_134bf63b-4637-42b8-ac8a-fab734e03b09.png?ex=656ef56f&is=655c806f&hm=cd18a7888ce5943007bf90f85299c2eb0ce696fb4f1bf02238a06c284ba1ab4d&=&format=webp&width=1038&height=1038")
fairy_wings.photo.attach(io: file, filename: "fairy_wings.png", content_type: "image/jpg")
fairy_wings.save

nautilus = Vehicle.new(
  user: user,
	name: 'Nautilus',
  vehicle_type: 'maritime',
  address: '20000 leagues under the sea',
  passengers_capacity: 150,
  price_per_day: 2000,
  cruising_speed: 50,
  fuel_type: 'essence',
  ecological_label: 'F',
  description: "The Nautilus is the famous submarine able to navigate far under the seas. You will enjoy your travel as it is equipped with the best furniture possible. Unfortunately you won't be able to command it yourself,  its captain, Nemo, comes with the rental."
)
file = URI.open("https://www.disneyphile.fr/wp-content/uploads/2021/08/nautilus-boat.jpg")
nautilus.photo.attach(io: file, filename: "nautilus.png", content_type: "image/jpg")
nautilus.save

vehicle = Vehicle.new(
  user: user,
	name: 'The Black Pearl Baby',
  vehicle_type: 'maritime',
  address: 'Caribbean',
  passengers_capacity: 80,
  price_per_day: 1200,
  cruising_speed: 90,
  fuel_type: 'wind',
  ecological_label: 'A',
  description: "You will arrive at your destination in the blink of an eye. Though you might become immortal in the process and turn into a skeleton under the moonlight, you will enjoy the company of rude and funny pirates."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176894639492571206/bohemond8467_the_black_pearl_from_pirates_of_the_carribbean_cfa0c3ef-7259-4c0b-a3f2-54541cf4105d.png?ex=6570878b&is=655e128b&hm=4f43632b82a4ba67933eef2ad0e93430d6f968b90795494c0c0cc72b571f44bb&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "black_pearl.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'Flying Boat',
  vehicle_type: 'aerial',
  address: 'Paris',
  passengers_capacity: 20,
  price_per_day: 1000,
  cruising_speed: 200,
  fuel_type: 'clouds',
  ecological_label: 'B',
  description: "Better not be seasick because riding the clouds is very much like riding waves from a raging sea ! This vehicle is a bit old but it allows you to cross worlds and go beyond our good old earth."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176895364197003324/bohemond8467_a_flying_boat_a720103e-b119-447b-93de-6213265c5393.png?ex=65708838&is=655e1338&hm=c2b746fdef267c512c7d8014b9361729f41b490ded7308b7d0cd043cd34193b8&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "flying_boat.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'Hot Air Ballon',
  vehicle_type: 'aerial',
  address: 'Paris, parc André Citroën',
  passengers_capacity: 5,
  price_per_day: 300,
  cruising_speed: 15,
  fuel_type: 'wind',
  ecological_label: 'C',
  description: "For a romantic walk among the parisian sky with your loved one, this hot-air balloon will be the perfect ride. Enjoy a cup of champagne and the view on the Eiffel tower."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176463363597930516/bohemond8467_a_hot_air_balloon_but_in_science_fiction_b2fbab63-1b7e-4523-a263-b66ebbd0330b.png?ex=656ef5e3&is=655c80e3&hm=99a89a8d6a41d9552e4f2cd82473c349023de7bbdcc090df3f6fb358ddf466cc&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "hot_air_balloon.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'Iron Man Suit',
  vehicle_type: 'aerial',
  address: 'San Francisco',
  passengers_capacity: 1,
  price_per_day: 500,
  cruising_speed: 500,
  fuel_type: 'electric',
  ecological_label: 'B',
  description: "Ever dreamt of flying high and fast ? Rent this suit to get the chance of being a super-hero the time of your rental. Perfect for work. xoxo, gossip girl."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176462888442023976/bohemond8467_the_suit_from_Iron_Man_in_a_dressing_ec667fdf-600c-45d1-92ad-236525f7d59d.png?ex=656ef572&is=655c8072&hm=1ac381567f8edb9a55c162ae64fe17105f4e2131baae965100e1973009e5c390&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "iron_man_suit.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'Aerial Subway',
  vehicle_type: 'aerial',
  address: 'London',
  passengers_capacity: 300,
  price_per_day: 120,
  cruising_speed: 40,
  fuel_type: 'fuel',
  ecological_label: 'G',
  description: "Are you tired of being stuck underearth in a noisy and smelly and crowded and basically horrible subway ? Well, you can now travel in the same environment but in the sky. Pretty cool, huh ?"
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176463436893388810/bohemond8467_an_aerial_subway_12db04fd-e15e-45fe-8953-f256460c1f83.png?ex=656ef5f4&is=655c80f4&hm=4bbf44ea469be12270ee62a9f7ff9fb7ea2a2a7cce270cc7bf0b3ea27cb414dd&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "aerial_subway.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'Millennium Falcon',
  vehicle_type: 'aerial',
  address: 'Grand Central',
  passengers_capacity: 22,
  price_per_day: 5000,
  cruising_speed: 500,
  fuel_type: 'futuristic',
  ecological_label: 'H',
  description: "This bad boy is quite old now, even technically it will only be invented in the future. Because it is quite old, it is now available at an unbeatable price, so do not hesitate for too long!"
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176896250054975538/bohemond8467_the_falcon_millenium_from_star_wars_c6cdc0c6-c4ed-4bc3-a290-4a7aa67e6690.png?ex=6570890b&is=655e140b&hm=344bf0c43cb42083e5e8198385f19a64976ddd556f452e7fd216e0073bb32542&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "millenium_falcon.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'Seven League Boots',
  vehicle_type: 'terrestrial',
  address: 'Tokyo',
  passengers_capacity: 1,
  price_per_day: 150,
  cruising_speed: 100,
  fuel_type: 'giantpower',
  ecological_label: 'A',
  description: "You have short legs and your friends always walk faster than you and they're not very nice and don't wait up? Rent these awesome giant boots and get your revenge now! But be careful, with these, you will be the one to wait up!"
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176463012748591114/bohemond8467_boots_from_giants_to_travel_in_adb910bb-6df9-4d30-8b56-be374c3c2eb9.png?ex=656ef58f&is=655c808f&hm=c33f0f6650a67490f7dcf8c33909bd08a07f5cbc78606da87d3a6e5e1aca2969&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "seven_league_boots.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'subway line 13 from Paris',
  vehicle_type: 'terrestrial',
  address: 'Paris',
  passengers_capacity: 300,
  price_per_day: -500,
  cruising_speed: 500,
  fuel_type: 'fuel',
  ecological_label: 'H',
  description: "You hate the subway? Well we hate it too, and we will actually pay you to take it, it is the least we can do, especially with line 13."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1177181317541150791/bohemond8467_a_picture_of_subway_line_13_in_paris_8db08f56-9a64-4458-ab33-82db50a40cf7.png?ex=65719289&is=655f1d89&hm=1a526eced483fab4b86f4bf3c9f70d2f3a242618048521ccc1c325bc27352d24&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "subway_line.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'motojet FC-20',
  vehicle_type: 'terrestrial',
  address: 'Tattooine',
  passengers_capacity: 1,
  price_per_day: 230,
  cruising_speed: 500,
  fuel_type: 'fuel',
  ecological_label: 'H',
  description: "Do not fear the hotness of Tattooine, with this superfast moto you will catch every cool refreshment existing on this planet. Be careful though, you might be chased down by a lord sith."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176896951292276776/bohemond8467_the_motorcycles_from_tatooine_in_star_wars_01bf781a-ac31-41fe-8322-21c62957d512.png?ex=657089b2&is=655e14b2&hm=265bf7e93a50191d398f57300d6efc982773bc7423f2e491466627bfa52a077a&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "motojet.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: "Anakin's podracer",
  vehicle_type: 'terrestrial',
  address: 'Tattooine',
  passengers_capacity: 1,
  price_per_day: 4000,
  cruising_speed: 995,
  fuel_type: 'fuel',
  ecological_label: 'H',
  description: "What an engine, what a machine! If you are always late at work or think your current means of transportation is too slow, you might like this incredible podracer: you will definitely be the fastest on earth!"
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1177180097502003230/bohemond8467_anakins_podracer_in_star_wars_6b0e8041-3a0c-4c37-a0f9-2f43df8083db.png?ex=65719166&is=655f1c66&hm=97c131e1d56ae4718d8c7ff3fefda544b2c837ca91825746d0e5e6a3a35fae21&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "anakin_podracer.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'Hoverboard',
  vehicle_type: 'terrestrial',
  address: 'California, United States',
  passengers_capacity: 1,
  price_per_day: 15,
  cruising_speed: 10,
  fuel_type: 'anti-gravity technology',
  ecological_label: 'A',
  description: "The Hoverboard is a sleek and futuristic personal transportation device equipped with anti-gravity technology. With a minimalist design and a smooth hover, it offers an effortless and stylish mode of travel through urban landscapes. Riders can effortlessly glide above the ground, zipping through city streets and futuristic plazas. The Hoverboard is the epitome of modern mobility, combining efficiency with a touch of sci-fi flair."
)
file = URI.open("https://cdn.discordapp.com/attachments/1168489400993316946/1176546352923148319/bohemond8467_sketching_in_black_and_white_of_a_spaceship_in_the_206b199c-b8cf-4c0a-95c9-62db69cf5e66.png?ex=656f432d&is=655cce2d&hm=e94713730ca3b191356663c2ae3537760e4396d91b5fefaf3b30959cef56072f&")
vehicle.photo.attach(io: file, filename: "hoverboard.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'Wagon',
  vehicle_type: 'terrestrial',
  address: '68 Ave Parmentier, 75011 Paris',
  passengers_capacity: 35,
  price_per_day: 7900,
  cruising_speed: 500,
  fuel_type: 'Creative logic',
  ecological_label: 'A',
  description: "The Wagon is not your ordinary mode of transportation; it's a rolling coding school on wheels, designed for aspiring programmers and tech enthusiasts. With its sleek, tech-inspired exterior, the Wagon travels from city to city, bringing coding education to the masses. Inside, state-of-the-art workstations equipped with the latest technology await eager learners. Fueled by creative logic, the Wagon provides a dynamic and collaborative coding environment. Whether you're a novice or an experienced developer, the Wagon is the perfect mobile classroom for unlocking the secrets of programming and innovation. Get on board and embark on a code-learning journey like never before!"
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1177184030563778580/bohemond8467_a_red_wagon_with_three_windows_f800b30d-0eb9-4f12-bbb6-228b37796ef6.png?ex=6571950f&is=655f200f&hm=2d105c33fab0cd3f02d5400b474bbb71a5129b4ff1db33612962cba7ff2bd29a&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "wagon.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'Stilt Bed',
  vehicle_type: 'terrestrial',
  address: 'Paris, France',
  passengers_capacity: 2,
  price_per_day: 10,
  cruising_speed:  7,
  fuel_type: 'dream essence',
  ecological_label: 'A',
  description: "If you have difficulties to leave your bed, go outside with it and finish your night! The Stilt Bed is no ordinary sleeping arrangement; it's a magical elevated dream platform that transcends the boundaries of the waking world. Suspended on slender stilts, the bed hovers above the ground, allowing the dreamer to enter the realm of dreams with ease. Crafted from the softest clouds and adorned with starlight, the Stilt Bed offers a peaceful and otherworldly space for a restful night's sleep. Fuelled by the essence of imagination, this enchanted bed takes its occupant on fantastical journeys through the landscapes of dreams, where anything is possible and every night is an adventure in Slumber Haven."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176902134147584080/bohemond8467_a_flying_bed_e028f3fa-5562-49e5-ad13-550ceb5bf4b6.png?ex=65708e86&is=655e1986&hm=5331e5d06f255d59238fa7b8a78a9f8c2b97e77843f354198621af978455288e&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "stilt_bed.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'Knight Bus',
  vehicle_type: 'terrestrial',
  address: 'London, UK',
  passengers_capacity: 50,
  price_per_day: 117,
  cruising_speed: 100000000,
  fuel_type: 'Floo Powder',
  ecological_label: 'B',
  description: "The Knight Bus is a magical mode of transportation for witches and wizards in need. With its vibrant purple color and eccentric design, it appears in a pinch, transporting passengers to their desired destination. The bus is known for its unique ability to navigate through the magical and non-magical realms, providing a quick and reliable way for wizards to travel. The interior is surprisingly spacious, featuring beds, chandeliers, and a shrunken head that provides entertainment during the journey. The Knight Bus is a quirky and essential part of the wizarding world's transportation network."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176902425081299046/bohemond8467_the_magic_bus_from_harry_potter_f990797b-eda0-4233-a435-1bdb420a137e.png?ex=65708ecb&is=655e19cb&hm=6d38ccedd8396bc3b0a279ba2dafe2789be960bf71e4449f657147405c51bc9a&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "knight_bus.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
  name: 'Mermaid Tail',
  vehicle_type: 'terrestrial',
  address: 'Gold Coast, Australia',
  passengers_capacity: 1,
  price_per_day: 50,
  cruising_speed: 20,
  fuel_type: 'Mechanical',
  ecological_label: 'A',
  description: "The Mermaid Tail is an elegant and magical means of personal aquatic transportation. Crafted from enchanted seashells and powered by the magic of the ocean, it allows you to gracefully glide through underwater realms. The Mermaid Tail offers a smooth and enchanting journey beneath the waves."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176902087246880829/bohemond8467_an_empty_mermaids_tail_for_a_human_to_put_on_like__e27b9e42-e523-4310-b884-e640e96949d6.png?ex=65708e7b&is=655e197b&hm=fb908cbbab8ec489c5395c2a7506fbe83cd011f355b81fa018ea2220f80b3d54&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "Mermaid_tail.png", content_type: "image/jpg")
vehicle.save

vehicle = Vehicle.new(
  user: user,
	name: 'Jolly Roger',
  vehicle_type: 'aerial',
  address: 'Brighton, England',
  passengers_capacity: 50,
  price_per_day: 700,
  cruising_speed: 5,
  fuel_type: 'fairy dust',
  ecological_label: 'F',
  description: "The Jolly Roger is the infamous pirate ship commanded by the cunning Captain Hook, terrorizing the waters of Neverland. With its menacing black sails adorned with a skull and crossbones, the ship strikes fear into the hearts of sailors. Manned by a crew of mischievous pirates, the Jolly Roger is a formidable vessel, sailing the magical seas with the intent of capturing Peter Pan and his Lost Boys. Powered by the mystical essence of mermaid's tears, the Jolly Roger is a symbol of adventure, danger, and the eternal pursuit of treasure in the whimsical world of Neverland."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176462937725091870/bohemond8467_the_pirate_boat_Jolly_Roger_of_Captain_Hook_4061d56c-4c71-449e-b2d7-75edb9d610da.png?ex=656ef57d&is=655c807d&hm=d3ae392563d746ab85e6b91f7ff54efe71de8a52b152cbbb81555382e4d97ac0&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "Mermaid_tail.png", content_type: "image/jpg")
vehicle.save


vehicle = Vehicle.new(
  user: user,
	name: 'Firebolt',
  vehicle_type: 'aerial',
  address: 'Edinburgh, Scotland',
  passengers_capacity: 2,
  price_per_day: 100,
  cruising_speed: 17,
  fuel_type: 'Phoenix Feather Core',
  ecological_label: 'B',
  description: "The Firebolt is a top-of-the-line racing broomstick, renowned for its incredible cruising_speed and precision. With a sleek design and a phoenix feather core, it's the choice of professional Quidditch players and cruising_speed enthusiasts. The Firebolt offers a thrilling and exhilarating ride through the magical skies."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176902168427634738/bohemond8467_a_flying_broom_43120250-1979-4716-9c59-18f8d4fe338a.png?ex=65708e8e&is=655e198e&hm=986ef4764bf25e4a648a45d45b3105fd55fe79dc21dd94fb70214389e43ff64e&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "Mermaid_tail.png", content_type: "image/jpg")
vehicle.save


vehicle = Vehicle.new(
  user: user,
	name: 'Hippogriff',
  vehicle_type: 'aerial',
  address: 'Delamere Forest, England',
  passengers_capacity: 2,
  price_per_day: 250,
  cruising_speed: 30,
  fuel_type: 'animal',
  ecological_label: 'B',
  description: "The Hippogriff is a majestic magical creature capable of flight. With its powerful wings and loyal nature, it serves as a noble and elegant steed for wizards seeking a unique and enchanting mode of transportation. Riding a Hippogriff offers a breathtaking experience as it soars through the skies."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176903483329347705/bohemond8467_a_hippogriff_1e7ff123-962f-4cd2-a443-3a5124990566.png?ex=65708fc8&is=655e1ac8&hm=5a0825d0a5da3f243984f4ab0c06715adfc2390d872b0af0756adf0edc4c9fa7&=&format=webp&width=1038&height=1038")
vehicle.photo.attach(io: file, filename: "Mermaid_tail.png", content_type: "image/jpg")
vehicle.save

dragon = Vehicle.new(
  user: user,
  name: 'Dragon',
  vehicle_type: 'aerial',
  address: 'Cairo, Egypt',
  passengers_capacity: 3,
  price_per_day: 425,
  cruising_speed: 25,
  fuel_type: 'mechanical',
  ecological_label: 'G',
  description: "The Dragon is a majestic and awe-inspiring mythical creature that serves as a powerful mode of transportation for the bravest of wizards. With scales that gleam like precious metals and wings that span the skies, the dragon is a symbol of strength and magical prowess. Riding atop a dragon's back is not merely a means of travel; it's an exhilarating experience through the mystical landscapes below. Fueled by the fiery breath of the dragon itself, this legendary creature offers a journey like no other, soaring through the clouds and embracing the freedom of the open skies. Only those with a heart full of courage and a spirit of adventure dare to mount the back of a dragon and embark on a flight of fantasy."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176902168427634738/bohemond8467_a_flying_broom_43120250-1979-4716-9c59-18f8d4fe338a.png?ex=65708e8e&is=655e198e&hm=986ef4764bf25e4a648a45d45b3105fd55fe79dc21dd94fb70214389e43ff64e&=&format=webp&width=1038&height=1038")
dragon.photo.attach(io: file, filename: "Mermaid_tail.png", content_type: "image/jpg")
dragon.save

flying_carpet = Vehicle.new(
  user: user,
	name: 'Flying carpet',
  vehicle_type: 'aerial',
  address: 'Sahara',
  passengers_capacity: 3,
  price_per_day: 25,
  cruising_speed: 12,
  fuel_type: 'magical',
  ecological_label: 'C',
  description: "The flying carpet is a magical flying carpet, woven with enchanted threads that allow it to soar through the skies. Originating from the mystical city of Agrabah, it offers a comfortable and smooth ride for adventurers. The flying carpet is a classic and timeless choice for transportation."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176463469969682512/bohemond8467_a_flying_carpet_c53adcce-9b06-425b-a16c-ab03f5d5a921.png?ex=656ef5fc&is=655c80fc&hm=282463269256e3d600bcded60628bbe5fcacf67a199a7c509de0fb5146759857&=&format=webp&width=1038&height=1038")
flying_carpet.photo.attach(io: file, filename: "Mermaid_tail.png", content_type: "image/jpg")
flying_carpet.save

tardis = Vehicle.new(
  user: user,
  name: 'Tardis',
  vehicle_type: 'spatial',
  address: '39-41 Barking Road, London E6 1PY England',
  passengers_capacity: 100000,
  price_per_day: 14000000,
  cruising_speed: '5',
  fuel_type: 'dying stars',
  ecological_label: 'G',
  description: "The Tardis is a Time Lord's iconic time-traveling spacecraft, capable of transcending time and space. With its deceptively simple blue police box exterior, the Tardis houses a vast and infinite interior, providing a unique and unpredictable journey through the timelines. Powered by artron energy, the Tardis is a remarkable and enigmatic mode of transportation."
)
file = URI.open("https://media.discordapp.net/attachments/1168489400993316946/1176463585518567424/bohemond8467_a_tardis_from_doctor_who_783e12e7-2c0d-43ab-9ed2-7d04c278889c.png?ex=656ef618&is=655c8118&hm=4d9901a1bae2cac9c21db717349e7a1ba4918dde37263d3ff15252e2773b5c30&=&format=webp&width=1038&height=1038")
tardis.photo.attach(io: file, filename: "Mermaid_tail.png", content_type: "image/jpg")
tardis.save


Booking.create!(
  user: user,
  vehicle: dragon,
  start_date: Date.new(2023, 11, 22),
  end_date: Date.new(2023, 11, 26),
  total_price: 300,
  status: 0
)

Booking.create!(
  user: renter,
  vehicle: fairy_wings,
  start_date: Date.new(2023, 11, 20),
  end_date: Date.new(2023, 11, 24),
  total_price: 400,
  status: 0
)

Booking.create!(
  user: renter,
  vehicle: nautilus,
  start_date: Date.new(2023, 11, 22),
  end_date: Date.new(2023, 11, 26),
  total_price: 300,
  status: 0
)

Booking.create!(
  user: renter,
  vehicle: tardis,
  start_date: Date.new(2023, 11, 22),
  end_date: Date.new(2023, 11, 26),
  total_price: 300,
  status: 0
)

Booking.create!(
  user: renter,
  vehicle: flying_carpet,
  start_date: Date.new(2023, 11, 22),
  end_date: Date.new(2023, 11, 26),
  total_price: 300,
  status: 0
)

p "created vehicles number - #{Vehicle.all.count} / user number #{User.all.count} / booking number #{Booking.all.count} "
