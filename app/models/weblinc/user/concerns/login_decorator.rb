Weblinc::User::Concerns::Login::ClassMethods.class_eval do
=begin
   def from_omniauth(auth)
     return nil if auth.nil?
     user = Weblinc::User.find_or_initialize_by_email(auth.info.email)
     if user
       user.is_omniauthed = true
       user.provider = auth.provider
       user.uid = auth.uid
       user.name = auth.info.name
       user.email = auth.info.email
       user.oauth_token = auth.credentials.token
       user.oauth_expires_at = Time.at(auth.credentials.expires_at)
       user.save!
     end
     user
   end
=end
end
