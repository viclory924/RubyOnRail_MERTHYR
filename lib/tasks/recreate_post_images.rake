namespace :carrierwave do
  task :recreate_post_images => :environment do
    Post.all.each do |ym| 
      begin
        #ym.process_your_uploader_upload = true # only if you use carrierwave_backgrounder
        ym.image.cache_stored_file! 
        ym.image.retrieve_from_cache!(ym.image.cache_name) 
        ym.image.recreate_versions!(:f_thumb) 
        ym.save! 
        puts ym.title
      rescue => e
        puts  "ERROR: Post: #{ym.id} -> #{e.to_s}"
      end
    end
  end
end
