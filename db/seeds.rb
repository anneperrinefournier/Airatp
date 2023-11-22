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

vehicles = []
vehicles.push(Vehicle.new(
  user: user,
  name: 'Tesla Model S',
  vehicle_type: 'terrestrial',
  address: '123 Main Street',
  passengers_capacity: 4,
  price_per_day: 50.0,
  cruising_speed: 120.0,
  fuel_type: 'Gasoline',
  ecological_label: 'Eco-Friendly',
  description: 'A comfortable and fuel-efficient car for your travels.'
))
file = URI.open("https://static.actu.fr/uploads/2023/04/photo-tesla-plaid-face-960x640.jpg")
vehicles.last.photo.attach(io: file, filename: "tesla-model-s.png", content_type: "image/jpg")
vehicles.last.save

vehicles.push(Vehicle.new(
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
))
file = URI.open("https://www.disneyphile.fr/wp-content/uploads/2021/08/nautilus-boat.jpg")
vehicles.last.photo.attach(io: file, filename: "nautilus.png", content_type: "image/jpg")
vehicles.last.save

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

vehicle = Vehicle.new(
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

vehicle = Vehicle.new(
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

vehicle = Vehicle.new(
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

vehicle = Vehicle.save(
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
file = URI.open("https://static.actu.fr/uploads/2023/04/photo-tesla-plaid-face-960x640.jpg")
vehicle.last.photo.attach(io: file, filename: "tesla-model-s.png", content_type: "image/jpg")
vehicle.last.save

Booking.create!(
  user: renter,
  vehicle: vehicles[0],
  start_date: Date.new(2023, 11, 15),
  end_date: Date.new(2023, 11, 19),
  total_price: 400,
  status: 1
)

Booking.create!(
  user: renter,
  vehicle: vehicles[1],
  start_date: Date.new(2023, 11, 22),
  end_date: Date.new(2023, 11, 26),
  total_price: 300,
  status: 1
)

p "created vehicles number - #{Vehicle.all.count} / user number #{User.all.count} / booking number #{Booking.all.count} "
