# Languages
puts "creating Languages"

arabe = Language.create({name: "Arabic", code: "ar"})
anglais = Language.create({name: "English", code: "en"})
francais = Language.create({name: "French", code: "fr"})
allemand = Language.create({name: "German", code: "de"})
italien = Language.create({name: "Italian", code: "it"})
portuguais = Language.create({name: "Portuguese", code: "pt"})
espagnol = Language.create({name: "Spanish", code: "es"})


# Countries
puts "creating Countries"

france = Country.create({name: "France", code: "fr"})
uk = Country.create({name: "United Kingdom", code: "uk"})
italie = Country.create({name: "Italy", code: "it"})
espagne = Country.create({name: "Espagne", code: "es"})
allemagne = Country.create({name: "Germany", code: "de"})
belgique = Country.create({name: "Belgium", code: "be"})
suisse = Country.create({name: "Switzerland", code: "sw"})
irelande = Country.create({name: "Ireland", code: "ir"})
luxembourg = Country.create({name: "Luxembourg", code: "lu"})


# 1 famille non fumeur sans animaux
puts "creating 1 family"
family = Family.create(
  email: "dupont@gmail.com",
  password: "plopplop",
  name: "Dupont",
  country_code: "FR",
  domestic_animal: false,
  description: "Raptim igitur properantes ut motus sui rumores celeritate nimia praevenirent, vigore corporum ac levitate confisi per flexuosas semitas ad summitates collium tardius evadebant. et cum superatis difficultatibus arduis ad supercilia venissent fluvii Melanis alti et verticosi, qui pro muro tuetur accolas circumfusus, augente nocte adulta terrorem quievere paulisper lucem opperientes. arbitrabantur enim nullo inpediente transgressi inopino adcursu adposita quaeque vastare, sed in cassum labores pertulere gravissimos. Iamque non umbratis fallaciis res agebatur, sed qua palatium est extra muros, armatis omne circumdedit. ingressusque obscuro iam die, ablatis regiis indumentis Caesarem tunica texit et paludamento communi, eum post haec nihil passurum velut mandato principis iurandi crebritate confirmans et statim inquit exsurge et inopinum carpento privato inpositum ad Histriam duxit prope oppidum Polam, ubi quondam peremptum Constantini filium accepimus Crispum. Novitates autem si spem adferunt, ut tamquam in herbis non fallacibus fructus appareat, non sunt illae quidem repudiandae, vetustas tamen suo loco conservanda; maxima est enim vis vetustatis et consuetudinis. Quin in ipso equo, cuius modo feci mentionem, si nulla res impediat, nemo est, quin eo, quo consuevit, libentius utatur quam intractato et novo. Nec vero in hoc quod est animal, sed in iis etiam quae sunt inanima, consuetudo valet, cum locis ipsis delectemur, montuosis etiam et silvestribus, in quibus diutius commorati sumus.",
  prefered_gender: :male,
  starting_date: Date.today,
  children_age_from: 2,
  children_age_to: 5,
  children_number: 2
)

# 2 aupair homme et femme
puts "creating 2 aupairs"
Aupair.create([
  {
    email: "michellouis@gmail.com",
    password: "plopplop",
    first_name: "Michel",
    last_name: "Louis",
    description: "Raptim igitur properantes ut motus sui rumores celeritate nimia praevenirent, vigore corporum ac levitate confisi per flexuosas semitas ad summitates collium tardius evadebant. et cum superatis difficultatibus arduis ad supercilia venissent fluvii Melanis alti et verticosi, qui pro muro tuetur accolas circumfusus, augente nocte adulta terrorem quievere paulisper lucem opperientes. arbitrabantur enim nullo inpediente transgressi inopino adcursu adposita quaeque vastare, sed in cassum labores pertulere gravissimos. Iamque non umbratis fallaciis res agebatur, sed qua palatium est extra muros, armatis omne circumdedit. ingressusque obscuro iam die, ablatis regiis indumentis Caesarem tunica texit et paludamento communi, eum post haec nihil passurum velut mandato principis iurandi crebritate confirmans et statim inquit exsurge et inopinum carpento privato inpositum ad Histriam duxit prope oppidum Polam, ubi quondam peremptum Constantini filium accepimus Crispum. Novitates autem si spem adferunt, ut tamquam in herbis non fallacibus fructus appareat, non sunt illae quidem repudiandae, vetustas tamen suo loco conservanda; maxima est enim vis vetustatis et consuetudinis. Quin in ipso equo, cuius modo feci mentionem, si nulla res impediat, nemo est, quin eo, quo consuevit, libentius utatur quam intractato et novo. Nec vero in hoc quod est animal, sed in iis etiam quae sunt inanima, consuetudo valet, cum locis ipsis delectemur, montuosis etiam et silvestribus, in quibus diutius commorati sumus.",
    birth_date: Date.today-30.years,
    country_code: "FR",
    driving_license: true,
    musician: false,
    gender: :male,
    dispo_from: Date.today
  },
  {
    email: "jladouce@gmail.com",
    password: "plopplop",
    first_name: "Jeanne",
    last_name: "Ladouce",
    description: "Raptim igitur properantes ut motus sui rumores celeritate nimia praevenirent, vigore corporum ac levitate confisi per flexuosas semitas ad summitates collium tardius evadebant. et cum superatis difficultatibus arduis ad supercilia venissent fluvii Melanis alti et verticosi, qui pro muro tuetur accolas circumfusus, augente nocte adulta terrorem quievere paulisper lucem opperientes. arbitrabantur enim nullo inpediente transgressi inopino adcursu adposita quaeque vastare, sed in cassum labores pertulere gravissimos. Iamque non umbratis fallaciis res agebatur, sed qua palatium est extra muros, armatis omne circumdedit. ingressusque obscuro iam die, ablatis regiis indumentis Caesarem tunica texit et paludamento communi, eum post haec nihil passurum velut mandato principis iurandi crebritate confirmans et statim inquit exsurge et inopinum carpento privato inpositum ad Histriam duxit prope oppidum Polam, ubi quondam peremptum Constantini filium accepimus Crispum. Novitates autem si spem adferunt, ut tamquam in herbis non fallacibus fructus appareat, non sunt illae quidem repudiandae, vetustas tamen suo loco conservanda; maxima est enim vis vetustatis et consuetudinis. Quin in ipso equo, cuius modo feci mentionem, si nulla res impediat, nemo est, quin eo, quo consuevit, libentius utatur quam intractato et novo. Nec vero in hoc quod est animal, sed in iis etiam quae sunt inanima, consuetudo valet, cum locis ipsis delectemur, montuosis etiam et silvestribus, in quibus diutius commorati sumus.",
    birth_date: Date.today-20.years,
    country_code: "FR",
    driving_license: false,
    musician: true,
    gender: :female,
    dispo_from: Date.today
  }
])

#preferences aupairs
puts "creating preferences aupairs"
SpokenLanguage.create([
  { aupair: Aupair.first, language: francais },
  { aupair: Aupair.first, language: anglais },
  { aupair: Aupair.last, language: francais },
  { aupair: Aupair.last, language: italien },
])

#preferences pays
puts "creating preferences pays"
PreferedCountry.create([
  { aupair: Aupair.first, country: france },
  { aupair: Aupair.first, country: italie },
  { aupair: Aupair.last, country: allemagne },
  { aupair: Aupair.last, country: irelande },
])

puts "seeding done"
