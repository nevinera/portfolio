desc "This task is called by heroku daily"
task :cron => :environment do
  Rake::Task['rebuild'].execute
end

desc "This task rebuilds the gallery information"
task :rebuild => :environment do
  Owner.first.rebuild_galleries_from_imgur!
end
