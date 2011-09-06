class Member < ActiveRecord::Base
  attr_accessible :member_id, :name, :email, :about, :links, :avatar, :token, :member_since, :github_user_id, :twitter_user_id, :login_count, :ruby_since, :neighborhood, :available, :show_email, :email_reminders, :admin

  has_many :projects

  def self.find_or_create_by_auth(auth_data)
    member = self.find_or_create_by_id(auth_data["uid"])
    if member.name != auth_data["user_info"]["name"]
      member.name = auth_data["user_info"]["name"]
      member.twitter_user_id = auth_data["user_info"]["nickname"]
      member.avatar = auth_data["user_info"]["image"]
      member.save
    end
    member.login_count =+ 1
    member.save
    return member
   end


  def optional_ruby_since
    self.ruby_since.blank? ? "" : self.ruby_since.strftime("%Y")    
  end


end
