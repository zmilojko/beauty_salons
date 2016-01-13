# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    Salon.create(name: 'Womanizer', address: 'Krunska 81', description: 'Womanizer nudi Vam negu i transformaciju po najnovijim trendovima po pristupačnim cenama',lat: '44.792572',lng: '20.502334', permalink: 'womanizer')
    Salon.create(name: 'Coco', address: 'Baba Višnjina 37', description: 'Frizersko kozmetički salon',lat: '44.801471',lng: '20.473908',permalink: 'coco')
    Salon.create(name: 'Salon Maca', address: 'Gospodar Jovanova 35', description: 'Frizerski salon',lat: '44.820358',lng: '20.4600998',permalink: 'salon-maca')
    Salon.create(name: 'Smile', address: 'Vojislava Ilića 125', description: 'Frizerski salon',lat: '44.7865136',lng: '20.5002895',permalink: 'smile')
    Salon.create(name: 'Talija', address: 'Narodnih heroja 42', description: 'Frizerski salon',lat: '44.8215804',lng: '20.4047143',permalink: 'talija')
    Service.create([{ name: 'Šišanje', slug: 'sisanje' }, { name: 'Brijanje',slug: 'brijanje' }, {name: 'Depilacija', slug: 'depilacija'}])
    Price.create([
      {salon_id: 1,service_id: 1, price:100} ,
      {salon_id: 1, service_id:2, price: 800},
      {salon_id: 3,service_id: 1, price:200},
      {salon_id: 2,service_id: 1, price:300},
      {salon_id: 2,service_id: 2, price: 123},
      {salon_id: 4, service_id: 3, price: 678}
    ])
