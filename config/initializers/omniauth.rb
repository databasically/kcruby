# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :twitter, "sDYkn6mYOPMmslawoo5SSg", "2qLjqTOKZuZFd9lyJJvXsV8GZUPypGyhfHzjoRkCb8", options[:authorize_params] = {:force_login => 'true'}
# end

settings = YAML.load_file(Rails.root + "config/omniauth.yml")
Rails.application.config.middleware.use OmniAuth::Strategies::Twitter, settings["key"], settings["secret"], :force_login => true
