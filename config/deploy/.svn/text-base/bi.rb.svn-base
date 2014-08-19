set :user, "osgeousr"
set :deploy_to, "/dg/local/#{application}"

set :rails_env, "bi"

role :web, "tu00gcsapp001.digitalglobe.com"                           # Your HTTP server, Apache/etc
role :app, "tu00gcsapp001.digitalglobe.com"                           # This may be the same as your `Web` server

role :db,  "tu00gcsapp001.digitalglobe.com", :primary => true         # This host will run the migrations (e.g. rake db:migrate) 
role :db,  "biwsdblgmt01.digitalglobe.com", :no_release => true       # This is where Rails migrations will run - no code deploy

set :use_sudo, false

namespace :deploy do
  task :start do
  end

  task :stop do
  end

  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end