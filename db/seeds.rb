require "csv"
require "faker"
require "date"

STATES = State.all
puts "Borrando paises"
Countrie.destroy_all
puts "Borrando estados"
State.destroy_all
puts "Borrando ofertas"
Offer.destroy_all
puts "Borrando rates"
Rate.destroy_all
puts "Borrando usuarios"
User.destroy_all
puts "Reiniciando secuencia"
ActiveRecord::Base.connection.reset_pk_sequence!("countries")
ActiveRecord::Base.connection.reset_pk_sequence!("states")
ActiveRecord::Base.connection.reset_pk_sequence!("offers")
ActiveRecord::Base.connection.reset_pk_sequence!("rates")
ActiveRecord::Base.connection.reset_pk_sequence!("users")
puts ""

puts "Empezará a insertar datos"
puts "Insertando Usuarios....."
puts ""
User.create([{ email: "fernando@gmail.com", name: "fernando", last_name: "Lopez", password: "123456", password_confirmation: "123456", id_number: "V-2512352", phone: "+58414232352", birthdate: Faker::Date.birthday(18, 65) }])
puts "Usuario: fernando@gmail.com, Contraseña: 123456"

User.create([{ email: "alfredo@gmail.com", name: "alfredo", last_name: "Lopez", password: "123456", password_confirmation: "123456", id_number: "V-2512352", phone: "+58414232352", birthdate: Faker::Date.birthday(18, 65) }])
puts "Usuario: alfredo@gmail.com, Contraseña: 123456"

User.create([{ email: "genesis@gmail.com", name: "genesis", last_name: "Lopez", password: "123456", password_confirmation: "123456", id_number: "V-2512352", phone: "+58414232352", birthdate: Faker::Date.birthday(18, 65) }])
puts "Usuario: genesis@gmail.com, Contraseña: 123456"

User.create([{ email: "jesus@gmail.com", name: "jesus", last_name: "Lopez", password: "123456", password_confirmation: "123456", id_number: "V-2512352", phone: "+58414232352", birthdate: Faker::Date.birthday(18, 65) }])
puts "Usuario: jesus@gmail.com, Contraseña: 123456"

User.create([{ email: "javier@gmail.com", name: "javier", last_name: "Lopez", password: "123456", password_confirmation: "123456", id_number: "V-2512352", phone: "+58414232352", birthdate: Faker::Date.birthday(18, 65) }])
puts "Usuario: javier@gmail.com, Contraseña: 123456"

User.create([{ email: "juan@gmail.com", name: "juan", last_name: "Lopez", password: "123456", password_confirmation: "123456", id_number: "V-2512352", phone: "+58414232352", birthdate: Faker::Date.birthday(18, 65) }])
puts "Usuario: juan@gmail.com, Contraseña: 123456"

User.create([{ email: "maria@gmail.com", name: "maria", last_name: "Lopez", password: "123456", password_confirmation: "123456", id_number: "V-2512352", phone: "+58414232352", birthdate: Faker::Date.birthday(18, 65) }])
puts "Usuario: maria@gmail.com, Contraseña: 123456"

puts ""
puts "Insertando Paises..."
csv_countries = File.read("app/assets/backups/countries.csv")
csv = CSV.parse(csv_countries, :headers => true)
csv.each do |row|
  countrie = Countrie.new(
    name: row["name"],
  )
  countrie.save!
end

puts ""
puts "Insertando Estados de paises..."
puts "Ten paciencia que tardara un poco mas que el anterior (1-3 min)..."
csv_states = File.read("app/assets/backups/states.csv")
csv = CSV.parse(csv_states, :headers => true)
csv.each do |row|
  states = State.new(
    name: row["name"],
  )
  states.countrie = Countrie.find(row["country_id"].to_i)
  states.save!
end

puts ""
puts "Insertando 100 Ofertas de vuelos..."
STATES.each_with_index do |state, index|
  Offer.create(state: state, cost: (100..1000).to_a.sample, date: Faker::Date.forward(150))
  break if index > 15
end

puts ""
puts "Insertando Tarifas de vuelos..."
Rate.create(name: "Medium", hand_baggage: "1 cambio, 8 Kg", baggage: "1 pieza, 23 Kg", cambios: "10% de penalidad", refunds: "15% de penalidad", child_discount: "true", miles: "true", seat: "true", cost: 200)
Rate.create(name: "Ultra", hand_baggage: "1 cambio, 8 Kg", baggage: "1 pieza, 23 Kg", cambios: "10% de penalidad", refunds: "15% de penalidad", child_discount: "true", miles: "true", seat: "true", cost: 300)
Rate.create(name: "Business", hand_baggage: "1 cambio, 8 Kg", baggage: "1 pieza, 23 Kg", cambios: "10% de penalidad", refunds: "15% de penalidad", child_discount: "true", miles: "true", seat: "true", cost: 400)

puts ""
puts "Seed Completado"
puts ""
