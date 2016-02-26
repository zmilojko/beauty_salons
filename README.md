# Welcome to Beauty Salons Rails app

Rails is a web-application framework that includes everything needed to create
database-backed web applications according to the Model-View-Control pattern.

This app will show you all the salons with all their prices and services.

## Install and run the 'Beauty Salons' App

    git clone git@github.com:culis1989/beauty_salons.git
    cd beauty_salons
    bundle install
    rake db:create db:migrate db:seed
    MAILCHIMP_API_KEY=blah-us8 MAILCHIMP_LIST_ID=list123  rails s


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
