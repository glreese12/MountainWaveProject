require 'capistrano/ext/multistage'

set :stages, %w(production bi development)
set :default_stage, "development"
set :application, "firstLookMessaging"
set :branch, Proc.new { Capistrano::CLI.ui.ask("Please enter branch path for deploy (e.g. branches/1.0 or trunk): ") }
set :repository,  "https://svn.digitalglobe.com/svn/rd/projects/#{application}/#{branch}"
set :scm, :subversion
set :scm_username, Proc.new { Capistrano::CLI.ui.ask("Please enter SVN username: ") }
set :scm_password, Proc.new { Capistrano::CLI.password_prompt("Please enter SVN password for #{scm_username}: ") }

desc "symlink the database.yml file from the shared directory"
task :symlink_database_yml, :roles => :app do
  run "ln -nsf #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end

after 'deploy:update_code','symlink_database_yml'
after "symlink_database_yml", "deploy:migrate"
