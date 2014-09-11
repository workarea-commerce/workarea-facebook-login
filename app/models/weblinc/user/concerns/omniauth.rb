module Weblinc::User::Concerns::Omniauth
  extend ActiveSupport::Concern

  included do
    field :provider,         type: String
    field :uid,              type: String
    field :oauth_token,      type: String
    field :oauth_expires_at, type: DateTime
    field :deleted_at,       type: DateTime
    field :is_omniauthed,    type: Boolean, default: false
  end
end
