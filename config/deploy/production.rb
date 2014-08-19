set :user, "osgeousr"
set :deploy_to, "/dg/local/#{application}"

set :deploy_via, :copy # The pu00gcsapp hosts do not have access to svn.digitalglobe.com so we need to ship a local copy
                       # By default it will check /tmp for the copy and if not existing or not current it will checkout
                       # from SVN
set :copy_cache, true 
set :rails_env, "production"

role :web, "pu00gcsapp004.digitalglobe.com","pu00gcsapp005.digitalglobe.com" # Your HTTP server, Apache/etc
role :app, "pu00gcsapp004.digitalglobe.com","pu00gcsapp005.digitalglobe.com" # This may be the same as your `Web` server
role :db,  "pu00gcsapp004.digitalglobe.com", :primary => true                # This host will run the migrations (e.g. rake db:migrate) 
role :db,  "dgwsdblgmt02", :no_release => true                       # This is where Rails migrations will run - no code deploy

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