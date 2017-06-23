Workarea::Storefront::Engine.routes.draw do
  get "auth/facebook/callback", to: "users/facebook_logins#create"

  get "auth/failure", to: "users/facebook_logins#failure"
end
