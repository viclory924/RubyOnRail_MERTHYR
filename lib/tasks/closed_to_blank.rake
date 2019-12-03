namespace :db do
  desc 'make all closed time to blank'
  task closed_to_blank: :environment do
    businesses = Business.all

    businesses.each do |b|
      Business::DAYS.each do |day|
        %w(opening closing).each do |time|
          b.update_attribute("#{day}_#{time}", '') if b.send("#{day}_#{time}") == 'closed'
        end
      end
    end
  end
end
