# begin
#   settings = YAML.load_file(Rails.root + "config/omniauth.yml")
# rescue 
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'] || settings["key"], ENV['TWITTER_SECRET'] || settings["secret"], :force_login => true
end
  
# Rails.application.config.middleware.use OmniAuth::Strategies::Twitter, ENV['TWITTER_KEY'] || settings["key"], ENV['TWITTER_SECRET'] || settings["secret"], :force_login => true
