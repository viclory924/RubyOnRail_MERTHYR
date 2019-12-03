require 'csv'

# Import businesses from db/seeds/*.csv specified by SEED
def import_businesses
  if ENV['SEED'].blank?
    puts 'ERROR: Please provide seed file. Should be a .csv filename stored in db/seeds/ directory.'
  else
    print 'Importing busineses ...'

    file_path = Rails.root.join("db/seeds/#{ENV['SEED']}")

    CSV.read(file_path, headers: true).each do |csv_row|
      new_row = csv_row.to_hash.except("Stamp").inject({}) do |row, (k, v)|
        row[k.downcase.parameterize.underscore.to_sym] = v if k.present?
        row
      end

      b = Business.new(new_row)

      b.save ?  print('.') : puts(b.errors.full_messages)
    end

    puts
    puts 'Imported.'
  end
end
