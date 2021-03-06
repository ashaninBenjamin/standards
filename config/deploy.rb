set :stages, %w(production)
set :default_stage, 'production'
require 'capistrano/ext/multistage'

set :rvm_type, :system
set :application, "standards"
set :scm, :git
set :repository, "https://github.com/ashaninBenjamin/standards.git"

set :use_sudo, false
set :ssh_options, :forward_agent => true
default_run_options[:pty] = true

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Seed database data"
  task :seed_data do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
  end
end

namespace :remote do
  desc "remote rake task"
  task :rake do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake #{ENV['TASK']}"
  end
end

before 'deploy:finalize_update', 'deploy:symlink_db'
after 'deploy:restart', 'unicorn:stop'
after 'deploy:update', 'deploy:cleanup'

require 'capi/unicorn'
require "rvm/capistrano"
# require 'bundler/capistrano'
require 'rake'
