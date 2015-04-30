module Weblinc
  decorate(User, with: 'weblinc_facebook') do
    decorated do
      include Weblinc::User::Concerns::Omniauth

      field :provider,         type: String
      field :uid,              type: String
      field :oauth_token,      type: String
      field :oauth_expires_at, type: DateTime
      field :deleted_at,       type: DateTime
      field :is_omniauthed,    type: Boolean, default: false

      validate :password_validity, unless: :is_omniauthed?
    end

    class_methods do
      def from_omniauth(auth)
        return nil if auth.nil?
        user = find_or_initialize_by_email(auth.info.email)
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

      def find_or_initialize_by_email(email)
        Weblinc::User.find_by_email(email) || new.tap do |instance|
          instance.email = email
        end
      end
    end
  end
end
