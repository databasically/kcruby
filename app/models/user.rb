class User < ActiveRecord::Base
  attr_accessible :name, :email, :about, :links, :avatar, :token, :user_since, :github_user_id, :twitter_user_id, :login_count, :ruby_since, :neighborhood, :available, :show_email, :email_reminders
end
