puts "destroying users"
[Language, Aupair, Family].each do |model|
  model.destroy_all
end
puts "users detroyed"

# Languages
puts "creating Languages"
Language.create([
  {name: "Arabic", code: "ar"},
  {name: "English", code: "en"},
  {name: "French", code: "fr"},
  {name: "German", code: "de"},
  {name: "Italian", code: "it"},
  {name: "Portuguese", code: "pt"},
  {name: "Spanish", code: "es"}
])

# 1 famille non fumeur sans animaux
puts "creating 1 family"
family = Family.create(email: "dupont@gmail.com", password: "plopplop", name: "Dupont", country_code: "FR", domestic_animal: false)

# 2 aupair homme et femme
puts "creating 2 aupairs"
Aupair.create([
  {email: "elouis@gmail.com", password: "plopplop", first_name: "Emile", last_name: "Louis", birth_date: Date.today-30.years, country_code: "FR", driving_license: true, musician: false, gender: 2},
  {email: "jladouce@gmail.com", password: "plopplop", first_name: "Jeanne", last_name: "Ladouce", birth_date: Date.today-20.years, country_code: "FR", driving_license: false, musician: true, gender: 3}
])

puts "seeding done"
