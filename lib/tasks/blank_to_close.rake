namespace :db do
  desc 'make all blank time to closed'
  task blank_to_closed: :environment do
    businesses = Business.all

    businesses.each do |b|
      Business::DAYS.each do |day|
        %w(opening closing).each do |time|
          b.update_attribute("#{day}_#{time}", 'closed') if b.send("#{day}_#{time}").blank?
        end
      end
    end
  end
end
