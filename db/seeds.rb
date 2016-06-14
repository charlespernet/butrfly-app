puts "destroying users"
[Aupair, Child, Family].each do |model|
  model.destroy_all
end
puts "users detroyed"


# 1 famille non fumeur sans animaux
puts "creating 1 family"
family = Family.create(email: "dupont@gmail.com", password: "plopplop", name: "Dupont", country_code: "FR", smoker: false, domestic_animal: false)

# 2 enfants, 1 handicap
puts "creating 2 children"
Child.create([
  {first_name: "Thomas", family: family, musician: true, birth_date: Date.today-10.years},
  {first_name: "Jean", family: family, musician: false, birth_date: Date.today-10.years, handicap: "Timmy"}
])

# 2 aupair homme et femme
puts "creating 2 aupairs"
Aupair.create([
  {email: "elouis@gmail.com", password: "plopplop", first_name: "Emile", last_name: "Louis", birth_date: Date.today-30.years, country_code: "FR", driving_license: true, musician: false, smoker: true, gender: 2},
  {email: "jladouce@gmail.com", password: "plopplop", first_name: "Jeanne", last_name: "Ladouce", birth_date: Date.today-20.years, country_code: "FR", driving_license: false, musician: true, smoker: false, gender: 3}
])

puts "seeding done"
