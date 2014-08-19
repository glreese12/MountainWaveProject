set :user, "nate"
set :deploy_to, "/Users/nate/flmsDeploy"

set :rails_env, "development"

role :web, "pmobile.local"                          # Your HTTP server, Apache/etc
role :app, "pmobile.local"                          # This may be the same as your `Web` server
role :db,  "pmobile.local", :primary => true # This is where Rails migrations will run

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
