require 'import_seed_data'

namespace :db do
  # Usage:
  #   rake db:import_businesses SEED=filename.csv
  #
  desc 'import businesses from CSV'
  task import_businesses: :environment do
    import_businesses
  end
end
