# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'pants'
set :stages, ["production"]
set :repo_url, 'https://github.com/KlausTrainer/pants.git'
set :deploy_via, :remote_cache

# Default branch is :master
current_branch = proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
if current_branch != 'master'
  ask :branch, current_branch
end

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/pants'

set :user, 'pants'
set :use_sudo, false

set :rbenv_path, "#{fetch(:deploy_to)}/rbenv"
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.2'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/media}

set :linked_files, %w{config/initializers/action_mailer.rb config/secrets.yml}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

set :puma_pidfile, "#{shared_path}/tmp/pids/puma.pid"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app) do
      execute "if [ -f #{fetch(:puma_pidfile)} ]; then kill -USR2 `cat #{fetch(:puma_pidfile)}`; fi"
    end
  end

  after :publishing, :restart

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end
end
