Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
    Weblinc.config.facebook_key,
    Weblinc.config.facebook_secret,
    Weblinc.config.facebook_options || {
      scope: 'public_profile,email', info_fields: 'email,name'
    }
end
