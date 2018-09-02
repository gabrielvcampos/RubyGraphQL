# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'inserindo usuários....'
User.create([
  { first_name: 'Gabriel Vitor', email: 'gabriel@gmail.com', password: '1234', role: 'member', last_name: 'Campos', street: 'Goias Street', number: 304, city: 'Barueri', postcode: '06440-170', country: 'Brazil'},
  { first_name: 'Leticia Abilio', email: 'leticia@gmail.com', password: '1234',  role: 'member', last_name: 'Nascimento', street: 'Bárbara Hipólito Capriotti Street', number: 7, city: 'Carapicuíba', postcode: '05447-960', country: 'Brazil'},
  { first_name: 'Fernando Donizetti', email: 'fernando@gmail.com', password: '1234',  role: 'member', last_name: 'Verago', street: 'Maestro Cardim Street', number: 1061, city: 'São Paulo', postcode: '05840-000', country: 'Brazil'}
])

puts 'inserindo usuários....(faker)'
20.times do |i|
  fake_name = Faker::Name.first_name
  User.create!(
    first_name: fake_name,
    last_name: Faker::Name.first_name,
    street: Faker::Address::street_address,
    number: Random.rand(10..1200),
    city: Faker::Address::city,
    postcode: Faker::Address::postcode,
    country: Faker::Address::country,
    email: "#{fake_name}_#{Random.rand(10..1200)}@gmail.com",
    password: '1234'
  )
end
puts 'inserindo usuários....DONE'
puts 'inserindo posts....'
User.all.each do |u|
  Random.rand(1..10).times do |p|
    Post.create!({
      body: LeroleroGenerator.sentence([1,2,3,4,5,6,7,8].sample),
      user: u
    })
  end
end 
puts 'inserindo posts....DONE'
puts 'inserindo comentários....'
User.all.each do |u|
  Random.rand(1..20).times do |p|
    Comment.create!({
      body: LeroleroGenerator.sentence([1,2].sample),
      user: u,
      post: Post.find(Random.rand(1..Post.count))
    })
  end
  puts 'inserindo comentários....DONE'
end 