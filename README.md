WE LOVE MERTHYR
---------------

Techniques
----------

- mongodb, mongoid
- rspec, factory_girl
- devise, cancan

Rake tasks
----------

Available tasks:

  - `rake db:seed` : to create admin users
  - `rake db:import_businesses SEED=filename.csv` : to import businesses from db/seeds/filename.csv
  - `rake db:blank_to_closed`   : to make all 'blank' opening and closing times are set to 'closed'


DATABASE
--------

Pull from Heroku:

- config heroku-mongo-sync plugin: https://github.com/marcofognog/heroku-mongo-sync:

```
  heroku plugins:install http://github.com/marcofognog/heroku-mongo-sync
```

- pull:

  `heroku mongo:pull`

Notice: `Heroku toolbelt` may not work and throws the error: `Install the Mongo gem to use mongo commands`, use `heroku`
gem instead then (`gem install heroku`)

Run
----------
Ref URL:
https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-18-04
https://stackoverflow.com/questions/6770498/how-to-import-bson-file-format-on-mongodb
