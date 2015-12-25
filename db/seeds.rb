# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    Salon.create(name: 'Womanizer', address: 'Krunska 81', description: 'Womanizer nudi Vam negu i transformaciju po najnovijim trendovima po pristupačnim cenama',lat: '44.792572',lng: '20.502334')
    Salon.create(name: 'Coco', address: 'Baba Višnjina 37', description: 'Frizersko kozmetički salon',lat: '44.801471',lng: '20.473908')
    Salon.create(name: 'Salon Maca', address: 'Gospodar Jovanova 35', description: 'Frizerski salon',lat: '44.820358',lng: '20.4600998')
    Salon.create(name: 'Smile', address: 'Vojislava Ilića 125', description: 'Frizerski salon',lat: '44.7865136',lng: '20.5002895')
    Salon.create(name: 'Talija', address: 'Narodnih heroja 42', description: 'Frizerski salon',lat: '44.8215804',lng: '20.4047143')

    Service.create([{ name: 'Šišanje' }, { name: 'Brijanje' }, {name: 'Depilacija'}])
