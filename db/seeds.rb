require 'csv'    

puts 'Empezará a insertar datos'
puts 'Insertando Paises...'

csv_countries = File.read('app/assets/backups/countries.csv')
csv = CSV.parse(csv_countries, :headers => true)
csv.each do |row|
    countrie = Countrie.new(
        name: row["name"]
    )
    countrie.save!
end
puts 'Insertando Estados de paises...'
puts 'Ten paciencia que tardara un poco mas que el anterior (1-3 min)...'
csv_states = File.read('app/assets/backups/states.csv')
csv = CSV.parse(csv_states, :headers => true)
csv.each do |row|
    states = State.new(
        name: row['name']
    )
    states.countrie = Countrie.find(row['country_id'].to_i)
    states.save!
end