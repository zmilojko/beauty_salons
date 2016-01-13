# Welcome to Beauty Salons Rails app

Rails is a web-application framework that includes everything needed to create
database-backed web applications according to the Model-View-Control pattern.

This app will show you all the salons with all their prices and services.

## Install 'Beauty Salons' App

- Fetch git repository to you local machine: Repository:
    - https://github.com/culis1989/beauty_salons

- Navigate command line to a folder where you stored this repo and start rails server:
   - rails s

- Navigate command line to a folder where you stored this repo and run:
    - rake db:migrate
    - rake db:seed

## ToDo:

- Add Address search box to Salon edit / new page
- Add phone, email, facebook, working hours to Salon
- Add City scaffold
- Add Municipal scaffold
- Add Municipal to Salon (index,show,edit,new)
- Style single service page
- Add Footer
- Add Header
- Change single salon url to '/salon/:permalink'
- Add permalink (unique) to service
- Change single service link to '/usluga/:permalink'
- Count salons for each service and display it in sidebar
- Modify service page to show all salons with that service (and display price)
- Sort salons by service price on single service page
- Add logo image to salon
- Style single salon page


## To update databse please run:
- rake db:drop db:create db:migrate
- rake db:seed
