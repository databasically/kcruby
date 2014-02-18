ruby_version = "1.9.3-p484"

include_recipe "sqlite-dev"
include_recipe "nodejs::default"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby ruby_version do
  global true
end

rbenv_gem "bundler" do
  ruby_version ruby_version
end

rbenv_execute "run" do
  command "bundle install --without production"
  cwd "/vagrant"
  ruby_version ruby_version
end

link "/home/vagrant/.bashrc" do
  to "/vagrant/customconfig/bashrc"
end

file "/vagrant/config/omniauth.yml" do
  content IO.read("/vagrant/config/omniauth.yml.example")
end

file "/vagrant/config/database.yml" do
  content IO.read("/vagrant/config/database.yml.example")
end

rbenv_execute "run" do
  command "bundle exec rake db:setup"
  cwd "/vagrant"
  ruby_version ruby_version
end
