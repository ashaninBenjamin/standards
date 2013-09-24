set :user, 'root'
set :rails_env, 'production'
set :keep_releases, 5

role :web, "62.76.185.12"
role :app, "62.76.185.12"
role :db,  "62.76.185.12", primary: true

set :branch, "develop"
set :deploy_to, "/rest/u/apps/standards"
