Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
    Weblinc.config.facebook_key,
    Weblinc.config.facebook_secret,
    Weblinc.config.facebook_options || {
      scope: 'public_profile,email',
      info_fields: 'email,name,first_name,last_name',
      client_options: {
        site: 'https://graph.facebook.com/v2.5',
        authorize_url: 'https://www.facebook.com/v2.5/dialog/oauth'
      },
      token_params: {
        parse: :json
      }
    }
end
