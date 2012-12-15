Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, FACEBOOK_KEY, FACEBOOK_SECRET,
             { :scope => 'email,user_birthday,user_photos',
               :display => 'popup',
               client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}
end
