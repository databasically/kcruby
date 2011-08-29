class Member < ActiveRecord::Base
  attr_accessible :name, :email, :about, :links, :avatar, :token, :member_since, :github_user_id, :twitter_user_id, :login_count, :ruby_since, :neighborhood, :available, :show_email, :email_reminders


  def self.find_or_create_by_auth(auth_data)
    member = self.find_or_create_by_id(auth_data["uid"])
    if member.name != auth_data["user_info"]["name"]
      member.name = auth_data["user_info"]["name"]
      member.twitter_member_id = auth_data["user_info"]["nickname"]
      member.avatar = auth_data["user_info"]["image"]
      member.save
    end
    return member
  end





end
