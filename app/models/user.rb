class User < ActiveRecord::Base
  attr_accessible :name, :email, :about, :links, :avatar, :token, :user_since, :github_user_id, :twitter_user_id, :login_count, :ruby_since, :neighborhood, :available, :show_email, :email_reminders


  def self.find_or_create_by_auth(auth_data)
    user = self.find_or_create_by_id(auth_data["uid"])
    if user.name != auth_data["user_info"]["name"]
      user.name = auth_data["user_info"]["name"]
      user.twitter_user_id = auth_data["user_info"]["nickname"]
      user.avatar = auth_data["user_info"]["image"]
      user.save
    end
    return user
  end





end
