source 'https://rubygems.org'

ruby '2.1.10'

#gem 'rails', '3.2.14'
#gem 'rails', '3.2.22.5'
gem 'rails', '4.0.0'

#gem 'rails4_upgrade', github: 'alindeman/rails4_upgrade'
#gem "strong_parameters"

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails' #,   '~> 3.2.6'
gem 'coffee-rails' #, '~> 3.2.1'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', :platforms => :ruby

gem 'uglifier', '>= 1.0.3'
#gem 'turbo-sprockets-rails3' # Precompile only changed assets.

# misc
gem 'thin'
gem 'jquery-rails'
gem 'simple_form'
gem 'faker'
gem 'mailcatcher', group: :development
gem 'kaminari'

# twitter bootstrap related
#gem 'therubyracer', '0.11.0'
gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem "font-awesome-rails"
#gem 'bootstrap-datetimepicker-rails'

# mongoid related
#gem 'mongoid', '~> 3.0.0'
gem 'mongoid', '~> 4.0'
gem 'cancancan-mongoid'
gem 'mongoid_taggable'
gem 'mongoid-slug'

# Upload, images processing.
gem 'carrierwave-mongoid', require: 'carrierwave/mongoid'
gem 'mini_magick'
gem 'fog'

#gem "tinymce-rails-imageupload", "~> 3.5.8.6"

# Geographic
gem 'geocoder' # move this gem to under mecury-rails gem won't work, strange.
gem 'gmaps4rails'
gem 'markerclustererplus-rails'

# Authentication, authorization.
gem 'devise'
#gem 'cancan'
gem 'cancancan'

# for api 
gem 'api-versions' , '~> 1.2', '>= 1.2.1'
gem 'jbuilder', '~> 2.4', '>= 2.4.1'

# Test tool
group :development, :test do
  #gem 'rspec-rails'
  #gem 'rspec-rails', '~> 2.14', '>= 2.14.2'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'capybara'
end


gem 'tire' # for eslasticsearch on Heroku

gem 'ice_cube' # for events multiple dates
gem 'sidekiq', '~> 2.12.2' # worker for update events occurrence
gem 'sidetiq'

gem 'omniauth-facebook', '1.4.0'
gem 'fb_graph'

gem 'prawn' # to generate PDF

gem 'pushwoosh', '~> 1.0', '>= 1.0.1' #Pushwoosh wrapper to remote API

group :production do
  gem 'rails_12factor' # to skip plugin injection
end

gem 'unicorn' # to run Unicorn web server for production

gem 'rack-cors', :require => 'rack/cors'

group :development do
  gem 'pry-rails'
end

