# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "cleaning database"
Game.destroy_all
User.destroy_all


# Seed Users
puts "creating users...."
user_1 = User.create!(
  first_name: "Anastasia",
  last_name: "Florentis",
  email: "test@gmail.com",
  password: "password"
)
user_2 = User.create!(
  first_name: "Felicity",
  last_name: "Strasser",
  email: "email@gmail.com",
  password: "password"
)
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: 'password'
  )
end

# Video Game Data
puts "creating games...."
games = [
  { name: "The Legend of Zelda: Breath of the Wild", genre: "Adventure", device: "Nintendo Switch", num_players: 1, pickup_adress: "10 Downing Street, London, UK", price: rand(20..60) },
  { name: "Elden Ring", genre: "RPG", device: "PlayStation", num_players: 1, pickup_adress: "221B Baker Street, London, UK", price: rand(30..70) },
  { name: "Fortnite", genre: "Battle Royale", device: "PlayStation", num_players: 100, pickup_adress: "Eiffel Tower, Paris, France", price: rand(10..30) },
  { name: "Halo Infinite", genre: "FPS", device: "Xbox", num_players: 16, pickup_adress: "1 Infinite Loop, Cupertino, CA 95014", price: rand(40..80) },
  { name: "Call of Duty: Warzone", genre: "FPS", device: "PC", num_players: 150, pickup_adress: "350 5th Ave, New York, NY 10118", price: rand(50..90) },
  { name: "Minecraft", genre: "Sandbox", device: "PC", num_players: 10, pickup_adress: "30 St Mary Axe, London, UK", price: rand(20..50) },
  { name: "Super Smash Bros. Ultimate", genre: "Fighting", device: "Nintendo Switch", num_players: 8, pickup_adress: "The Shard, 32 London Bridge St, London, UK", price: rand(25..55) },
  { name: "Animal Crossing: New Horizons", genre: "Simulation", device: "Nintendo Switch", num_players: 4, pickup_adress: "4059 Mt Lee Dr, Hollywood, CA 90068", price: rand(35..65) },
  { name: "League of Legends", genre: "MOBA", device: "PC", num_players: 10, pickup_adress: "Buckingham Palace, London, UK", price: rand(15..45) },
  { name: "Among Us", genre: "Party", device: "PC", num_players: 10, pickup_adress: "500 S Buena Vista St, Burbank, CA 91521", price: rand(5..25) },
  { name: "FIFA 23", genre: "Sports", device: "PlayStation", num_players: 2, pickup_adress: "Wembley Stadium, London, UK", price: rand(30..60) },
  { name: "Madden NFL 23", genre: "Sports", device: "Xbox", num_players: 2, pickup_adress: "MetLife Stadium, East Rutherford, NJ 07073", price: rand(30..60) },
  { name: "Hades", genre: "Roguelike", device: "PC", num_players: 1, pickup_adress: "The Acropolis, Athens, Greece", price: rand(20..50) },
  { name: "Red Dead Redemption 2", genre: "Adventure", device: "PlayStation", num_players: 32, pickup_adress: "Alamo Square, San Francisco, CA", price: rand(40..80) },
  { name: "The Witcher 3: Wild Hunt", genre: "RPG", device: "PC", num_players: 1, pickup_adress: "Rynek Główny, Kraków, Poland", price: rand(30..70) },
  { name: "Mario Kart 8 Deluxe", genre: "Racing", device: "Nintendo Switch", num_players: 12, pickup_adress: "Shibuya Crossing, Tokyo, Japan", price: rand(25..55) },
  { name: "Grand Theft Auto V", genre: "Action", device: "PlayStation", num_players: 30, pickup_adress: "Piccadilly Circus, London, UK", price: rand(40..80) },
  { name: "Fall Guys", genre: "Party", device: "PC", num_players: 60, pickup_adress: "Trafalgar Square, London, UK", price: rand(10..30) },
  { name: "Rocket League", genre: "Sports", device: "PC", num_players: 8, pickup_adress: "Tower Bridge, London, UK", price: rand(25..55) },
  { name: "Overwatch 2", genre: "FPS", device: "PC", num_players: 12, pickup_adress: "Oxford Street, London, UK", price: rand(40..80) },
  { name: "Valorant", genre: "FPS", device: "PC", num_players: 10, pickup_adress: "Baker Street, London, UK", price: rand(20..50) },
  { name: "Apex Legends", genre: "Battle Royale", device: "PlayStation", num_players: 60, pickup_adress: "Covent Garden, London, UK", price: rand(15..45) },
  { name: "Cuphead", genre: "Platformer", device: "Xbox", num_players: 2, pickup_adress: "Camden Market, London, UK", price: rand(20..50) },
  { name: "Dark Souls III", genre: "RPG", device: "PlayStation", num_players: 1, pickup_adress: "Greenwich Park, London, UK", price: rand(30..70) },
  { name: "Cyberpunk 2077", genre: "RPG", device: "PC", num_players: 1, pickup_adress: "St. Paul's Cathedral, London, UK", price: rand(40..80) },
  { name: "Destiny 2", genre: "FPS", device: "Xbox", num_players: 12, pickup_adress: "Leicester Square, London, UK", price: rand(35..75) },
  { name: "Star Wars Jedi: Fallen Order", genre: "Adventure", device: "PlayStation", num_players: 1, pickup_adress: "Notting Hill, London, UK", price: rand(30..60) },
]
more_games = [
{ name: "Assassin's Creed Valhalla", genre: "Action", device: "PlayStation", num_players: 1, pickup_adress: "Richmond Park, London, UK", price: rand(40..80) },
{ name: "Pokemon Sword", genre: "RPG", device: "Nintendo Switch", num_players: 1, pickup_adress: "King's Cross Station, London, UK", price: rand(30..70) },
{ name: "Monster Hunter: World", genre: "Action", device: "PlayStation", num_players: 4, pickup_adress: "Hyde Park, London, UK", price: rand(35..75) }
]

users = User.all
# Seed Games
games.each do |game|
  game = Game.new(
    name: game[:name],
    genre: game[:genre],
    device: game[:device],
    num_players: game[:num_players],
    pickup_adress: game[:pickup_adress],
    price: game[:price]
  )
  game.user = users.sample
  game.save
end

more_games.each do |game|
  game = Game.new(
    name: game[:name],
    genre: game[:genre],
    device: game[:device],
    num_players: game[:num_players],
    pickup_adress: game[:pickup_adress],
    price: game[:price]
  )
  game.user = user_2
  game.save
end
